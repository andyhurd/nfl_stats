<?php # extended_statistics.php  - display extended stat leaders (with pagination I hope!)

// get requested granularity and stat_type for the current page
$granularity = $_REQUEST['granularity'];
$stat_type = $_REQUEST['stat_type'];
$stat_abbr_sort = $_REQUEST['stat_abbr'];

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

// set the page title, active_tab and include the HTML header.
$page_url = $STATISTICS_URL;
$nav_active = $STATISTICS_URL;
include('./header.inc');
		
		$query = "SELECT category_stat_id
					FROM NFL_CATEGORY_STAT
						JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
						JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
					WHERE stat_abbr = '" . $stat_abbr_sort . "'
						AND category_desc = '" . $stat_type . "';";
		
		$result = executeQuery($query);
		
		if ($row = mysql_fetch_array($result)) {
			$category_stat_id = $row['category_stat_id'];
		}

?>

    	<h1><?php echo $STATISTICS_HEADER ?></h1>
		<div>
			<ul class="nav nav-pills">
			  <li <?php echoActive($PASSING, $stat_type); ?>>
				<a href="<?php echo $_SERVER['PHP_SELF'] . '?granularity=' . $granularity . "&stat_type=" . $PASSING . "&stat_abbr=YDS"; ?>"><?php echo $PASSING; ?></a>
			  </li>
			  <li <?php echoActive($RUSHING, $stat_type)?>>
				<a href="<?php echo $_SERVER['PHP_SELF'] . '?granularity=' . $granularity . "&stat_type=" . $RUSHING . "&stat_abbr=YDS"; ?>"><?php echo $RUSHING; ?></a>
			  </li>
			  <li <?php echoActive($RECEIVING, $stat_type)?>>
				<a href="<?php echo $_SERVER['PHP_SELF'] . '?granularity=' . $granularity . "&stat_type=" . $RECEIVING . "&stat_abbr=YDS"; ?>"><?php echo $RECEIVING; ?></a>
			  </li>
			  <li <?php echoActive($KICKING, $stat_type)?>>
				<a href="<?php echo $_SERVER['PHP_SELF'] . '?granularity=' . $granularity . "&stat_type=" . $KICKING . "&stat_abbr=FGM"; ?>"><?php echo $KICKING; ?></a>
			  </li>
			  <li <?php echoActive($DEFENSE, $stat_type)?>>
				<a href="<?php echo $_SERVER['PHP_SELF'] . '?granularity=' . $granularity . "&stat_type=" . $DEFENSE . "&stat_abbr=TACK"; ?>"><?php echo $DEFENSE; ?></a>
			  </li>
			</ul>
		</div>
        
		<?php		
				$query =   "SELECT category_stat_id, stat_abbr
							FROM NFL_CATEGORY
								JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
							WHERE category_desc = '" . $stat_type . "';";
													
				$result = executeQuery($query);
				$stat_category_array_string = "(";
				$closing_paren = ")";
				
				// populate the table
				while ($row = mysql_fetch_array($result)) {
					$headers[$row['category_stat_id']] = $row['stat_abbr'];
					$stat_category_array_string .= $row['category_stat_id'] . " ,";
				}
				
				$stat_category_array_string = substr($stat_category_array_string, 0, -1) . $closing_paren;
				
				$query =   "SELECT NFL_CONTRACT.contract_id, person_first_name, person_last_name, NFL_PERSON.person_id
							FROM NFL_CONTRACT
								JOIN NFL_PLAYER_GAME_STAT ON NFL_CONTRACT.contract_id = NFL_PLAYER_GAME_STAT.contract_id
								JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_stat_id = NFL_PLAYER_GAME_STAT.category_stat_id
								JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
								JOIN NFL_PERSON ON NFL_PERSON.person_id = NFL_CONTRACT.person_id
								JOIN (SELECT SUM(player_game_stat_value) as sort_val, contract_id
										FROM NFL_PLAYER_GAME_STAT
										WHERE category_stat_id = " . $category_stat_id . "
										GROUP BY contract_id) SUB ON SUB.contract_id = NFL_CONTRACT.contract_id
							WHERE contract_year = " . Date('Y') . "
								AND category_desc = '" . $stat_type . "'
							GROUP BY contract_id
							HAVING SUM(player_game_stat_value) > 0
							ORDER BY SUB.sort_val DESC;";
							
				$result = executeQuery($query);
				
				while ($row = mysql_fetch_array($result)) {
					$player['contract_id'] = $row['contract_id'];
					$player['name'] = $row['person_first_name'] . " " . $row['person_last_name'];
					$player['person_id'] = $row['person_id'];
					
					$sub_query =   "SELECT SUM(player_game_stat_value) as stat_value, category_stat_id
								FROM NFL_PLAYER_GAME_STAT
								WHERE category_stat_id IN " . $stat_category_array_string . "
									AND contract_id = " . $row['contract_id'] . "
								GROUP BY category_stat_id";
								
					$sub_result = executeQuery($sub_query);
					
					while ($sub_row = mysql_fetch_array($sub_result)) {
						$player[$sub_row['category_stat_id']] = $sub_row['stat_value'];
					}
					
					$players[$row['contract_id']] = $player;
				}
				?>
				<table class="table table-condensed table-striped table-hover">
					<thead>
						<tr>
							<th>Rank</th>
							<th>Player</th>
				<?
				foreach ($headers as $category_stat_id => $stat_abbr) {
					echo "<th><a href=\"" . $EXTENDED_STATISTICS . "?granularity=" . $granularity . "&stat_type=" . $stat_type . "&stat_abbr=" . $stat_abbr . "\"";
					if ($stat_abbr == $stat_abbr_sort) {
						echo " style=\"color: black;\"";
					}
					echo ">" . $stat_abbr . "</a></th>";
				}
				echo "</tr></thead><tbody>";
				$i = 1;
				if (isset($players)) {
					foreach ($players as $contract_id => $player) {
						echo "<tr onClick=\"location.href='" . $PLAYER_URL . "?person_id=" . $player['person_id'] . "'\">";
						echo "<td>" . $i . "</td>";
						foreach ($player as $stat => $value) {
							if ($stat == 'name') {
								echo "<td>" . $value . "</td>";
							}
							if ($stat != 'contract_id' && $stat != 'name' && $stat != 'person_id') {
								echo "<td>" . $value . "</td>";
							}
						}
						echo "</tr>";
						$i++;
					}
				} else {
					echo "<tr><td colspan=\"" . (count($headers) + 2) . "\">(No Stats To Display)</td></tr>";
				}
				echo "</tbody></table>";
		?>
        
		<!--
        <div class="pagination pagination-small pagination-centered">
        	<ul>
            	<li class="disabled"><a href="#">Prev</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li class="disabled"><a href="#">Next</a></li>
            </ul>
        </div>
		-->

<?php

include('./footer.inc'); //Include the HTML footer.

?>