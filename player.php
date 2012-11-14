<?php # Script 3.11 - register.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $PLAYER_URL;
$nav_active = $PLAYERS;
include('./header.inc');
?>
        
        <?php
		
			// obtain team_id paramter
			$person_id = $_REQUEST['person_id'];
			
			// define the query
			$query =	"SELECT person_first_name, person_last_name, position_abbr, team_location, team_name, NFL_CONTRACT.contract_year, person_number, contract_salary, NFL_CONTRACT.contract_id, person_height, person_weight
						 FROM NFL_PERSON
						 	LEFT JOIN NFL_CONTRACT ON NFL_CONTRACT.person_id = NFL_PERSON.person_id
							LEFT JOIN NFL_PLAYER_POSITION ON NFL_PLAYER_POSITION.contract_id = NFL_CONTRACT.contract_id
							LEFT JOIN NFL_POSITION ON NFL_PLAYER_POSITION.position_id = NFL_POSITION.position_id
							LEFT JOIN NFL_TEAM ON NFL_CONTRACT.team_id = NFL_TEAM.team_id
						 WHERE NFL_PERSON.person_id = " . $person_id . "
						 ORDER BY NFL_CONTRACT.contract_year DESC;";
			
			// execute query, populates $result
			$result = executeQuery($query);
			
			$i = 0;
			$positions = "";
			$first_year = 1;
			$year = "YEAR";
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {

				if ($first_year == 1 || $year == $row['contract_year']) {
					$first_year = 0;
					$year = $row['contract_year'];
					$height = $row['person_height'];
					$weight = $row['person_weight'];
					$player_name = $row['person_first_name'] . " " . $row['person_last_name'];
					$number = $row['person_number'];
					$positions .= $row['position_abbr'] . " | ";
					$team = $row['team_location'] . " " . $row['team_name'];
					$salary = $row['contract_salary'];
					$contract_id = $row['contract_id'];
				}
			}
			?>
			<div class="hero-unit">
            	<table>
                	<tr>
                    <td class="span9">
                        <h1><?php echo $player_name; ?></h1>
						
						<?php if (isset($contract_id)) { ?>
							<h4><?php echo $team; ?></h4>
							<h4><?php echo "#" . $number . " " . substr($positions, 0, -2); ?></h4>
						<?php } ?>
						
						<h5><?php $heightArray = generateHeightArray(); echo "Height: " . $heightArray[$height]; ?></h5>
						<h5><?php echo "Weight: " . $weight; ?></h5>
						
						<?php if (isset($contract_id)) { ?>
							<h5><?php echo "Salary: $" . number_format($salary); ?></h5>
						<?php } ?>
                   	</td>
                    <td class="span3">
                        <div class="imgwell">
                        	<?php
							$image_path = './images/players/' . $person_id . '.jpg';
                            if (file_exists($image_path)) {
							?>
                            	<img class="img-rounded" src="<?php echo $image_path; ?>" />
                            <?php } else { ?>
                            	<img class="img-rounded" src="./images/players/default.jpg" />
                            <?php } ?>
                        </div>
                	</td>
                    </tr>
					<?php if (isset($_SESSION['user'])) { ?>
						<tr>
							<td>
								<button class="btn" onClick="location.href='<?php echo $EDIT_PLAYER_URL . "?person_id=" . $person_id . "&edit="; ?>'">Edit Player</button>
								<?php if (isset($contract_id)) { ?>
									<button class="btn" onClick="location.href='<?php echo $EDIT_CONTRACT_URL . "?contract_id=" . $contract_id . "&edit="; ?>'">Edit Current Contract</button>
								<?php } else { ?>
									<button class="btn" onClick="location.href='<?php echo $EDIT_CONTRACT_URL . "?person_id=" . $person_id; ?>'">Add Contract</button>
								<?php } ?>
							</td>
							<td>
							</td>
						</tr>
					<?php } ?>
                </table>
			</div>
			<?php
			
			if (isset($contract_id)) {
			
			/* retrieve player stat categories and headers */
			$query =   "SELECT category_desc, category_stat_id, stat_abbr, contract_year
						FROM NFL_PERSON
							JOIN NFL_CONTRACT ON NFL_CONTRACT.person_id = NFL_PERSON.person_id
							JOIN NFL_PLAYER_POSITION ON NFL_PLAYER_POSITION.contract_id = NFL_CONTRACT.contract_id
							JOIN NFL_POSITION ON NFL_POSITION.position_id = NFL_PLAYER_POSITION.position_id
							JOIN NFL_POSITION_CATEGORY ON NFL_POSITION_CATEGORY.position_id = NFL_POSITION.position_id
							JOIN NFL_CATEGORY ON NFL_POSITION_CATEGORY.category_id = NFL_CATEGORY.category_id
							JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
							JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						WHERE NFL_PERSON.person_id = " . $person_id . "
						ORDER BY contract_year DESC;";
			
			$result = executeQuery($query);
			
			$stat_category_array_string = "(";
			$closing_paren = ")";
			
			$stat_category = "STAT_CATEGORY";
			
			$first_year = 1;
			$year = "YEAR";
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				if ($first_year == 1 || $year == $row['contract_year']) {
					$first_year = 0;
					$year = $row['contract_year'];
					if ($stat_category != $row['category_desc']) {
						unset($category_stats);
						$stat_category = $row['category_desc'];
					}
					$category_stats[$row['category_stat_id']] = $row['stat_abbr'];
					$stat_categories[$row['category_desc']] = $category_stats;
					$stat_category_array_string .= $row['category_stat_id'] . " ,";
				}
			}
			
			$stat_category_array_string = substr($stat_category_array_string, 0, -1) . $closing_paren;
			
			/* retrieve player career stats */
			$query =   "SELECT SUM(player_game_stat_value) as stat_value, stat_abbr, NFL_CATEGORY_STAT.category_stat_id
						FROM NFL_PLAYER_GAME_STAT
							JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_stat_id = NFL_PLAYER_GAME_STAT.category_stat_id
							JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						WHERE NFL_CATEGORY_STAT.category_stat_id IN " . $stat_category_array_string . "
							AND contract_id IN (SELECT contract_id
												FROM NFL_CONTRACT
												WHERE person_id = " . $person_id . ")
						GROUP BY NFL_CATEGORY_STAT.category_stat_id;";
												
			$result = executeQuery($query);
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				$stat_values[$row['category_stat_id']] = $row['stat_value'];
			}
			?>
			
			<h1>Career Stats</h1>
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
			
            <!-- YEARLY STATS SECITON -->
			<?php
			
			
			
			

			/* retrieve player stat categories and headers */
			// $query =   "SELECT category_desc, category_stat_id, stat_abbr, contract_year
						// FROM NFL_PERSON
							// JOIN NFL_CONTRACT ON NFL_CONTRACT.person_id = NFL_PERSON.person_id
							// JOIN NFL_PLAYER_POSITION ON NFL_PLAYER_POSITION.contract_id = NFL_CONTRACT.contract_id
							// JOIN NFL_POSITION ON NFL_POSITION.position_id = NFL_PLAYER_POSITION.position_id
							// JOIN NFL_POSITION_CATEGORY ON NFL_POSITION_CATEGORY.position_id = NFL_POSITION.position_id
							// JOIN NFL_CATEGORY ON NFL_POSITION_CATEGORY.category_id = NFL_CATEGORY.category_id
							// JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
							// JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						// WHERE NFL_PERSON.person_id = " . $person_id . "
						// ORDER BY contract_year DESC;";
			
			 // $result = executeQuery($query);
			
			// // $stat_category_array_string = "(";
			// // $closing_paren = ")";
			
			// // $stat_category = "STAT_CATEGORY";
			
			// // $first_year = 1;
			// // $year = "YEAR";
			
			// // // populate the table
			 // while ($row = mysql_fetch_array($result)) {
				// $year = $row['contract_year'];
				
				
			 // }
			
			//$stat_category_array_string = substr($stat_category_array_string, 0, -1) . $closing_paren;
			$years;
			$teams;
			$salary2;
			$query = "SELECT contract_year, contract_id, team_name, contract_salary
						FROM NFL_CONTRACT
							INNER JOIN NFL_TEAM ON NFL_TEAM.team_id = NFL_CONTRACT.team_id
						WHERE person_id = ". $person_id . "
						 ORDER BY NFL_CONTRACT.contract_year DESC;";
						
						$result = executeQuery($query);
						 while ($row = mysql_fetch_array($result)) {
				$query =   "SELECT SUM(player_game_stat_value) as stat_value, stat_abbr, NFL_CATEGORY_STAT.category_stat_id
							FROM NFL_PLAYER_GAME_STAT
								JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_stat_id = NFL_PLAYER_GAME_STAT.category_stat_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
							WHERE NFL_CATEGORY_STAT.category_stat_id IN " . $stat_category_array_string . "
								AND contract_id IN (SELECT contract_id
													FROM NFL_CONTRACT
													WHERE person_id = " . $person_id . "
														AND contract_year = " . $row['contract_year'] . ")
							GROUP BY NFL_CATEGORY_STAT.category_stat_id";
													
				$result2 = executeQuery($query);

				while ($row2 = mysql_fetch_array($result2)) {
					$stat_values[$row2['category_stat_id']] = $row2['stat_value'];
				}
				$yearly_stat[$row['contract_year']] = $stat_values;
				$teams[$row['contract_year']] = $row['team_name'];
				
				$salary2[$row['contract_year']] = number_format($row['contract_salary']);

			 }
			/* retrieve player career stats */


			// populate the table

			?>
			
			<h1>Yearly Stats</h1>
            <table class="table">
                <thead>
					<tr>
						<th></th>
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
                        	Year
                        </th>
                    	<th>
                        	Team
                        </th>
                    	<th>
                        	Salary
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
					foreach ($yearly_stat as $theyear => $stat_values) {
					?>
                	<tr>
                    	<td>
                        	<?php echo $theyear; ?>
                        </td>
                    	<td>
                        	<?php echo $teams[$theyear]; ?>
                        </td>
                    	<td>
                        	<?php echo "$" . $salary2[$theyear]; ?>
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
                    <?php } ?>
            	</tbody>
            </table>
			
			
			<!-- GAME STATS SECTION -->
            <?php
						
			$query =   "SELECT player_game_stat_value as stat_value, NFL_GAME.game_id,
							DATE_FORMAT(game_time, '%c/%e/%y') as game_time, HOME_TEAM.team_name as home_team, AWAY_TEAM.team_name as away_team, stat_abbr, NFL_CATEGORY_STAT.category_stat_id
						FROM NFL_PLAYER_GAME_STAT
							JOIN NFL_GAME ON NFL_PLAYER_GAME_STAT.game_id = NFL_GAME.game_id
							JOIN NFL_TEAM HOME_TEAM ON HOME_TEAM.team_id = NFL_GAME.team_id_home
							JOIN NFL_TEAM AWAY_TEAM ON AWAY_TEAM.team_id = NFL_GAME.team_id_visiting
							JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_stat_id = NFL_PLAYER_GAME_STAT.category_stat_id
							JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						WHERE NFL_CATEGORY_STAT.category_stat_id IN " . $stat_category_array_string . "
							AND contract_id IN (SELECT contract_id
												FROM NFL_CONTRACT
												WHERE person_id = " . $person_id . ")
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
			} else {
				echo "<h4>(Player has no contract)</h4>";
			}

include('./footer.inc'); //Include the HTML footer.

?>
