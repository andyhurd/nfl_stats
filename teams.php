<?php # teams.php - displays a searchable list of NFL teams

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $TEAM_URL;
$nav_active = $TEAMS_URL;
$nav_search = 1;
include('./header.inc');
?>
        
    	<h1><?php echo $TEAMS_HEADER ?></h1>
		<table class="table row-fluid table-striped table-hover table-condensed">
        	<tbody>
        <?php
				
			// define the query
			$query =	"SELECT team_id, team_name, team_location
						 FROM NFL_TEAM
						 ORDER BY team_location";
			
			// execute the query
			$result = executeQuery($query);
			
			// populate the table
			while ($row = mysql_fetch_array($result)) {
				$team_link = $TEAM_URL . "?team_id=" . $row['team_id'];
		?>
                <tr>
                    <td onClick="location.href='<?php echo $team_link; ?>'"><?php echo $row['team_location'] . " " . $row['team_name'] ?></td>
                </tr>
        <?php
			}
		?>
        	</tbody>
		</table>

<?php

include('./setup_quicksearch.inc');
include('./footer.inc'); //Include the HTML footer.

?>
