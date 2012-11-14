<?php # team.php - display single team info

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

// set the page title, active nav bar tab, and include the HTML header.
$page_url = $TEAM_URL;
$nav_active = $TEAMS_URL;
include('./header.inc');
?>
        
        <?php
		
			// obtain team_id paramter
			$team_id = $_REQUEST['team_id'];
			
			// define the query
			$query =	"SELECT team_name, conference_abbr, division_name, team_location
						 FROM NFL_TEAM
						 	JOIN NFL_DIVISION ON NFL_DIVISION.division_id = NFL_TEAM.division_id
							JOIN NFL_CONFERENCE ON NFL_CONFERENCE.conference_id = NFL_DIVISION.conference_id
						 WHERE team_id = " . $team_id;
			
			// execute query, populates $result
			$result = executeQuery($query);
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
			?>
            <div class="hero-unit">
            	<table>
                	<tr>
                    <td class="span9">
                    <h1><?php echo $row['team_location'] . " " . $row['team_name']; ?></h1>
                    <h4><?php echo $row['conference_abbr'] . " " . $row['division_name']; ?></h4>
                   	</td>
                    <td class="span3">
                        <div class="imgwell">
                        	<?php
							$image_path = './images/teams/' . $team_id . '.jpg';
                            if (file_exists($image_path)) {
							?>
                            	<img class="img-rounded" src="<?php echo $image_path; ?>" />
                            <?php } else { ?>
                            	<img class="img-rounded" src="./images/players/default.jpg" />
                            <?php } ?>
                        </div>
                	</td>
                    </tr>
                </table>
            </div>
			<?php } 
			
			/* retrieve stat categories and headers */
			$query =   "SELECT category_desc, category_stat_id, stat_abbr
						FROM NFL_CATEGORY_STAT
							JOIN NFL_CATEGORY ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
							JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						WHERE stat_abbr IN ('COMP', 'ATT', 'YDS', 'TD', 'REC', 'INT', 'FGM', 'XPM', 'PTS') OR (stat_abbr = 'SACK' AND category_desc = 'Defense');";
			
			$result = executeQuery($query);
			
			$stat_category_array_string = "(";
			$closing_paren = ")";
			
			$stat_category = "STAT_CATEGORY";
						
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				if ($stat_category != $row['category_desc']) {
					unset($category_stats);
					$stat_category = $row['category_desc'];
				}
				$category_stats[$row['category_stat_id']] = $row['stat_abbr'];
				$stat_categories[$row['category_desc']] = $category_stats;
				$stat_category_array_string .= $row['category_stat_id'] . " ,";
			}
			
			$stat_category_array_string = substr($stat_category_array_string, 0, -1) . $closing_paren;
			
			/* retrieve player career stats */
			$query =   "SELECT SUM(team_game_stat_value) as stat_value, stat_abbr, NFL_CATEGORY_STAT.category_stat_id
						FROM NFL_TEAM_GAME_STAT
							JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_stat_id = NFL_TEAM_GAME_STAT.category_stat_id
							JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						WHERE NFL_CATEGORY_STAT.category_stat_id IN " . $stat_category_array_string . "
							AND team_id = " . $team_id . "
						GROUP BY NFL_CATEGORY_STAT.category_stat_id;";
												
			$result = executeQuery($query);
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				$stat_values[$row['category_stat_id']] = $row['stat_value'];
			}
			?>
			
			<h1>All-time Stats</h1>
            <table class="table">
                <thead>
					<tr>
						<?php
							foreach ($stat_categories as $category => $stats) {
								echo "<th colspan=\"" . count($stats) . "\">" . $category . "</th>";
							}
						?>
					</tr>
                    <tr>
                        <?php
							foreach ($stat_categories as $category => $stats) {
								foreach ($stats as $category_stat_id => $stat_abbr) {
                                	echo "<th>" . $stat_abbr . "</th>";
								}
							}
                        ?>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                        <?php
							foreach ($stat_categories as $category => $stats) {
								foreach ($stats as $category_stat_id => $stat_abbr) {
									if (isset($stat_values[$category_stat_id])) {
										echo "<td>" . $stat_values[$category_stat_id] . "</td>";
									} else {
                                		echo "<td>0</td>";
									}
								}
							}
                        ?>
                	</tr>
            	</tbody>
            </table>
            
            <?php
						
			$query =   "SELECT team_game_stat_value as stat_value, NFL_GAME.game_id,
							DATE_FORMAT(game_time, '%c/%e/%y') as game_time, HOME_TEAM.team_name as home_team, AWAY_TEAM.team_name as away_team, stat_abbr, NFL_CATEGORY_STAT.category_stat_id
						FROM NFL_TEAM_GAME_STAT
							JOIN NFL_GAME ON NFL_TEAM_GAME_STAT.game_id = NFL_GAME.game_id
							JOIN NFL_TEAM HOME_TEAM ON HOME_TEAM.team_id = NFL_GAME.team_id_home
							JOIN NFL_TEAM AWAY_TEAM ON AWAY_TEAM.team_id = NFL_GAME.team_id_visiting
							JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_stat_id = NFL_TEAM_GAME_STAT.category_stat_id
							JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						WHERE NFL_CATEGORY_STAT.category_stat_id IN " . $stat_category_array_string . "
							AND NFL_TEAM_GAME_STAT.team_id = " . $team_id . "
						GROUP BY NFL_CATEGORY_STAT.category_stat_id, game_id
						ORDER BY NFL_GAME.game_id;";
												
			$result = executeQuery($query);
			
			$game_id = "GAME ID";
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				if ($game_id != $row['game_id']) {
					$game_id = $row['game_id'];
					
					unset($game_stats);
					$game_stats['home_team'] = $row['home_team'];
					$game_stats['away_team'] = $row['away_team'];
					$game_stats['game_time'] = $row['game_time'];
				}
				$game_stats[$row['category_stat_id']] = $row['stat_value'];
				$games[$row['game_id']] = $game_stats;
			}
			?>
			
			<h1>Game Stats</h1>
            <table class="table">
                <thead>
					<tr>
						<th></th>
						<th></th>
						<?php
							foreach ($stat_categories as $category => $stats) {
								echo "<th colspan=\"" . count($stats) . "\">" . $category . "</th>";
							}
						?>
					</tr>
                    <tr>
                    	<th>
                        	Date
                        </th>
                    	<th>
                        	Game
                        </th>
                        <?php
							foreach ($stat_categories as $category => $stats) {
								foreach ($stats as $category_stat_id => $stat_abbr) {
                                	echo "<th>" . $stat_abbr . "</th>";
								}
							}
                        ?>
                    </tr>
                </thead>
                <tbody>
                	<?php
					if (isset($games)) {
                    foreach ($games as $game_id => $stat_values) {
					?>
                	<tr>
                    	<td>
                        	<?php echo $stat_values['game_time']; ?>
                        </td>
                    	<td>
                        	<?php echo $stat_values['away_team'] . " @ " .  $stat_values['home_team']; ?>
                        </td>
                        <?php
							foreach ($stat_categories as $category => $stats) {
								foreach ($stats as $category_stat_id => $stat_abbr) {
									if (isset($stat_values[$category_stat_id])) {
										echo "<td>" . $stat_values[$category_stat_id] . "</td>";
									} else {
                                		echo "<td>0</td>";
									}
								}
							}
                        ?>
                	</tr>
                    <?php }
					} else { ?>
						<td>(No games played)</td>
						<td>&nbsp;</td>
                    <?php
						foreach ($stat_categories as $category => $stats) {
							foreach ($stats as $category_stat_id => $stat_abbr) {
								echo "<td>&nbsp;</td>";
							}
						}
					}
					?>
            	</tbody>
            </table>

<?php

include('./footer.inc'); //Include the HTML footer.

?>
