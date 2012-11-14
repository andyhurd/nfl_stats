<?php # Script 3.11 - register.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_title = $STATISTICS_URL;
$nav_active = $STATISTICS_URL;
include('./header.inc');
?>


    	<h1><?php echo $STATISTICS_HEADER ?></h1>
        
        <?php
			$stat_categories['Passing0'] = 'Yards';
			$stat_categories['Defense1'] = 'Tackles';
			$stat_categories['Rushing0'] = 'Yards';
			$stat_categories['Defense2'] = 'Sacks';
			$stat_categories['Receiving0'] = 'Yards';
			$stat_categories['Defense3'] = 'Interceptions';
			
			foreach ($stat_categories as $category => $stat_desc) {
				$query =   "SELECT NFL_PERSON.person_id, person_first_name, person_last_name, NFL_CATEGORY.category_desc, SUM(player_game_stat_value) as stat_value, stat_abbr
							FROM NFL_PERSON
								JOIN NFL_CONTRACT ON NFL_CONTRACT.person_id = NFL_PERSON.person_id
								JOIN NFL_PLAYER_GAME_STAT ON NFL_CONTRACT.contract_id = NFL_PLAYER_GAME_STAT.contract_id
								JOIN NFL_CATEGORY_STAT ON NFL_PLAYER_GAME_STAT.category_stat_id = NFL_CATEGORY_STAT.category_stat_id
								JOIN NFL_CATEGORY ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
							WHERE NFL_CATEGORY_STAT.category_stat_id = (SELECT category_stat_id
																		FROM NFL_CATEGORY_STAT
																			JOIN NFL_CATEGORY ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
																			JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id
																		WHERE NFL_CATEGORY.category_desc = '" . substr($category, 0, -1) . "'
																			AND NFL_STAT.stat_desc = '" . $stat_desc . "')
									AND NFL_CONTRACT.contract_year = 2012
							GROUP BY NFL_PERSON.person_id
							ORDER BY SUM(player_game_stat_value) DESC
							LIMIT 5;";
							
				$result = executeQuery($query);
				
				$i = 1;
				unset($stat_leaders);
				while ($row = mysql_fetch_array($result)) {
					unset($stat_leader);
					$stat_leader['id'] = $row['person_id'];
					$stat_leader['fname'] = $row['person_first_name'];
					$stat_leader['lname'] = $row['person_last_name'];
					$stat_leader['value'] = $row['stat_value'];
					$stat_leader['stat_abbr'] = $row['stat_abbr'];
					$stat_leaders[$i] = $stat_leader;
					$stat_cats[$category] = $stat_leaders;
					$i++;
				}
			}
			
		?>




<table class="table table-bordered">
	<thead>
        <tr>
            <th class="span6" colspan="3">Offensive Leaders</th>
            <th class="span6" colspan="3">Defensive Leaders</th>
        </tr>
        <tr>
            <th class="span4" colspan="2">Passing Yards</th>
            <th class="span2" colspan="1">PASYDS</th>
            <th class="span4" colspan="2">Tackles</th>
            <th class="span2" colspan="1">TACK</th>
        </tr>
    </thead>
    
    <tr>
        <td class="span4" colspan="2">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Passing0'][$i]['fname'] != "") {
							echo "<tr><td><a href=\"" . $PLAYER_URL . "?person_id=" . $stat_cats['Passing0'][$i]['id'] . "\">" . $i . ". " . $stat_cats['Passing0'][$i]['fname'] . " " . $stat_cats['Passing0'][$i]['lname'] . "</a></td></tr>";
						} else {
							echo "<tr><td>" . $i . ". (None)</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span2" colspan="1">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Passing0'][$i]['fname'] != "") {
							echo "<tr><td>" . $stat_cats['Passing0'][$i]['value'] . "</td></tr>";
						} else {
							echo "<tr><td>0</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span4" colspan="2">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Defense1'][$i]['fname'] != "") {
							echo "<tr><td><a href=\"" . $PLAYER_URL . "?person_id=" . $stat_cats['Defense1'][$i]['id'] . "\">" . $i . ". " . $stat_cats['Defense1'][$i]['fname'] . " " . $stat_cats['Defense1'][$i]['lname'] . "</a></td></tr>";
						} else {
							echo "<tr><td>" . $i . ". (None)</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span2" colspan="1">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Defense1'][$i]['fname'] != "") {
							echo "<tr><td>" . $stat_cats['Defense1'][$i]['value'] . "</td></tr>";
						} else {
							echo "<tr><td>0</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
    <tr>
    	<td class="span6" colspan="3"><a href="./extended_statistics.php?granularity=<?php echo $INDIVIDUAL; ?>&stat_type=<?php echo $PASSING; ?>&stat_abbr=YDS">Complete Leaders</a></td>
    	<td class="span6" colspan="3"><a href="./extended_statistics.php?granularity=<?php echo $INDIVIDUAL; ?>&stat_type=<?php echo $DEFENSE; ?>&stat_abbr=TACK">Complete Leaders</a></td>
    </tr>
    </tr>
    <tr>
		<th class="span4" colspan="2">Rushing Yards</th>
		<th class="span2" colspan="1">YDS</th>
        <th class="span4" colspan="2">Sacks</th>
        <th class="span2" colspan="1">SACK</th>
	</tr>
    
    <tr>
        <td class="span4" colspan="2">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Rushing0'][$i]['fname'] != "") {
							echo "<tr><td><a href=\"" . $PLAYER_URL . "?person_id=" . $stat_cats['Rushing0'][$i]['id'] . "\">" . $i . ". " . $stat_cats['Rushing0'][$i]['fname'] . " " . $stat_cats['Rushing0'][$i]['lname'] . "</a></td></tr>";
						} else {
							echo "<tr><td>" . $i . ". (None)</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span2" colspan="1">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Rushing0'][$i]['fname'] != "") {
							echo "<tr><td>" . $stat_cats['Rushing0'][$i]['value'] . "</td></tr>";
						} else {
							echo "<tr><td>0</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span4" colspan="2">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Defense2'][$i]['fname'] != "") {
							echo "<tr><td><a href=\"" . $PLAYER_URL . "?person_id=" . $stat_cats['Defense2'][$i]['id'] . "\">" . $i . ". " . $stat_cats['Defense2'][$i]['fname'] . " " . $stat_cats['Defense2'][$i]['lname'] . "</a></td></tr>";
						} else {
							echo "<tr><td>" . $i . ". (None)</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span2" colspan="1">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Defense2'][$i]['fname'] != "") {
							echo "<tr><td>" . $stat_cats['Defense2'][$i]['value'] . "</td></tr>";
						} else {
							echo "<tr><td>0</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
    <tr>
    	<td class="span6" colspan="3"><a href="./extended_statistics.php?granularity=<?php echo $INDIVIDUAL; ?>&stat_type=<?php echo $RUSHING; ?>&stat_abbr=YDS">Complete Leaders</a></td>
    	<td class="span6" colspan="3"><a href="./extended_statistics.php?granularity=<?php echo $INDIVIDUAL; ?>&stat_type=<?php echo $DEFENSE; ?>&stat_abbr=SACK">Complete Leaders</a></td>
    </tr>
    </tr>
        <tr>
		<th class="span4" colspan="2">Receiving Yards</th>
		<th class="span2" colspan="1">YDS</th>
        <th class="span4" colspan="2">Interceptions</th>
        <th class="span2" colspan="1">INT</th>
	</tr>
    
    <tr>
        <td class="span4" colspan="2">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Receiving0'][$i]['fname'] != "") {
							echo "<tr><td><a href=\"" . $PLAYER_URL . "?person_id=" . $stat_cats['Receiving0'][$i]['id'] . "\">" . $i . ". " . $stat_cats['Receiving0'][$i]['fname'] . " " . $stat_cats['Receiving0'][$i]['lname'] . "</a></td></tr>";
						} else {
							echo "<tr><td>" . $i . ". (None)</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span2" colspan="1">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Receiving0'][$i]['fname'] != "") {
							echo "<tr><td>" . $stat_cats['Receiving0'][$i]['value'] . "</td></tr>";
						} else {
							echo "<tr><td>0</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span4" colspan="2">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Defense3'][$i]['fname'] != "") {
							echo "<tr><td><a href=\"" . $PLAYER_URL . "?person_id=" . $stat_cats['Defense3'][$i]['id'] . "\">" . $i . ". " . $stat_cats['Defense3'][$i]['fname'] . " " . $stat_cats['Defense3'][$i]['lname'] . "</a></td></tr>";
						} else {
							echo "<tr><td>" . $i . ". (None)</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
        <td class="span2" colspan="1">
         <table class="table table-striped table-condensed">
             <tbody>
             	<?php
					foreach (range(1, 5) as $i) {
						if ($stat_cats['Defense3'][$i]['fname'] != "") {
							echo "<tr><td>" . $stat_cats['Defense3'][$i]['value'] . "</td></tr>";
						} else {
							echo "<tr><td>0</td></tr>";
						} ?>
                <?php } ?>
              </tbody>
            </table>
        </td>
    </tr>
    <tr>
    	<td class="span6" colspan="3"><a href="./extended_statistics.php?granularity=<?php echo $INDIVIDUAL; ?>&stat_type=<?php echo $RECEIVING; ?>&stat_abbr=YDS">Complete Leaders</a></td>
    	<td class="span6" colspan="3"><a href="./extended_statistics.php?granularity=<?php echo $INDIVIDUAL; ?>&stat_type=<?php echo $DEFENSE; ?>&stat_abbr=INT">Complete Leaders</a></td>
    </tr>
</table>
    
<?php

include('./footer.inc'); //Include the HTML footer.

?>







