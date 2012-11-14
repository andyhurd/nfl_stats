<?php # standings.php - shows divisional standings

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $STANDINGS_URL;
$nav_active = $STANDINGS_URL;
include('./header.inc');
?>
        
    	<h1><?php echo $STANDINGS_HEADER ?></h1>
		<table class="table table-condensed table-striped">
        	<tr>
        <?php
		
			// defines divisional table headers
			$standings_headers = array("DIVISION", "W", "L", "T", "PCT", "HOME", "ROAD", "PF", "PA", "DIFF");
			
			/*
			Retrieve all teams with this info from TEAM_GAME_STAT table
			Order By CONFERENCE, DIVISION, GAMES_WON / (GAMES_WON + GAMES_LOST + GAMES_TIED)
			*/
				
			// define the query
			$query =	"SELECT conference_name, conference_abbr, division_name, team_name, team_location
						 FROM NFL_TEAM
						 	JOIN NFL_DIVISION ON NFL_DIVISION.division_id = NFL_TEAM.division_id
							JOIN NFL_CONFERENCE ON NFL_CONFERENCE.conference_id = NFL_DIVISION.conference_id
						 ORDER BY conference_abbr, division_name;";
			
			// execute the query
			$result = executeQuery($query);
			
			// var to control omission of extra top row
			$opening_header = 1;
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				if ($standings_headers[0] != $row['conference_abbr'] . " " . $row['division_name'] || $conference != $row['conference_name']) {
					if ($conference != $row['conference_name']) {
						$conference = $row['conference_name'];
						if ($opening_header == 0) {
							echo "<tr><td colspan=" . count($standings_headers) . ">&nbsp;</td><tr>";
						}
						$opening_header = 0;
						echo "<tr><th class=\"" . strtolower($row['conference_abbr']) . "\" colspan=" . count($standings_headers) . ">" . $conference . "</th><tr>";
					}
					
					$standings_headers[0] = $row['conference_abbr'] . " " . $row['division_name'];
					echo "<tr><td colspan=" . count($standings_headers) . "></td><tr>";
			
					// generate all table headers
					foreach ($standings_headers as $standing_header) {
						echo "<th>" . $standing_header . "</th>\n";
					}
				}
		?>
                <tr>
                    <td><?php echo $row['team_location'] . " " . $row["team_name"] ?></td>
                    <td>6</td>
                    <td>3</td>
                    <td>0</td>
                    <td>.667</td>
                    <td>3-2-0</td>
                    <td>3-1-0</td>
                    <td>254</td>
                    <td>185</td>
                    <td>+69</td>
                </tr>
        <?php
			}
		?>
		</table>
<?php

include('./footer.inc'); //Include the HTML footer.

?>