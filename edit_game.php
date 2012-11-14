<?php # Script 3.11 - register.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $EDIT_GAME_URL;
$nav_active = $ADMIN;
include('./header.inc');
?>
		<?php if (!(isset($_SESSION['user']))) { ?>
			<script>
				window.location = './index.php';
			</script>
		<? } ?>
        
		<?php // ------------------------------------ HANDLE SUBMITTED FORM --------------------------------- //
			if (isset($_REQUEST['submit'])) {
			
				// obtain input parameters
				if ($_REQUEST['homeTeam'] != -1) {
					$home_team_id = $_REQUEST['homeTeam'];
					$home_team = TRUE;
				} else {
					echo "<p>No home team was entered.</p>";
					$home_team = FALSE;
				}
				if ($_REQUEST['awayTeam'] != -1) {
					$away_team_id = $_REQUEST['awayTeam'];
					$away_team = TRUE;
				} else {
					echo "<p>No away team was entered.</p>";
					$away_team = FALSE;
				}
				if ($_REQUEST['stadium'] != -1) {
					$stadium_id = $_REQUEST['stadium'];
					$stadium = TRUE;
				} else {
					echo "<p>No stadium was entered.</p>";
					$stadium = FALSE;
				}
				if ($_REQUEST['date'] != "") {
					$date_string = $_REQUEST['date'];
					$date = TRUE;
				} else {
					echo "<p>No date was entered.</p>";
					$date = FALSE;
				}
				if ($_REQUEST['time'] != "") {
					$time = $_REQUEST['time'];
					$time_array = explode(":", $time);
					if (substr($time_array[1], 3, 2) == "PM") {
						$time_array[0] = $time_array[0] + 12;
						if ($time_array[0] == 24){
							$time_array[0] = 12;
						} else if ($time_array[0] == 12) {
							$time_array[0] = 0;
						}
					}
					$time_array[1] = substr($time_array[1], 0, 2);
					$time = $time_array[0] . ":" . $time_array[1] . ":00";
					$time_valid = TRUE;
				} else {
					echo "<p>No time was entered.</p>";
					$time_valid = FALSE;
				}
				
				if ($home_team && $away_team && $stadium && $date && $time) {
					
					// define the query
					$query="INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
								VALUES ('" . $date_string . " " . $time . "', " . $stadium_id . ", " . $home_team_id . ", " . $away_team_id . ");";
					
					// execute query, populates $result
					$result = executeQuery($query);
		?>
		
			<h4>Added:</h4>
			<table class="table">
				<tr>
					<td>
						Home Team: <?php echo $home_team_id; ?>
					</td>
				</tr>
				<tr>
					<td>
						Away Team: <?php echo $away_team_id; ?>
					</td>
				</tr>
				<tr>
					<td>
						Stadium: <?php echo $stadium_id; ?>
					</td>
				</tr>
				<tr>
					<td>
						Date: <?php echo $date_string; ?>
					</td>
				</tr>
				<tr>
					<td>
						Time: <?php echo $time; ?>
					</td>
				</tr>
			</table>
			
		<?php }
		
		// ------------------------------------ DISPLAY UNSUBMITTED FORM --------------------------------- //
			} else {
			
			if (isset($_REQUEST['edit'])) {
				echo "<h1>" . $EDIT_GAME_HEADER . "</h1>";
			} else {
				echo "<h1>" . $ADD_GAME_HEADER . "</h1>";
			}
		?>
		
			<?php $header = $ADD_GAME_HEADER; ?>
			<form class="form-horizontal" action="<? echo $EDIT_GAME_URL; ?>">
			
				<?php
				
					// ------------------------------- HOME TEAM SELECT ---------------------------------- //
						
					// define the query
					$query =	"SELECT team_id, team_name, team_location
								 FROM NFL_TEAM
								 ORDER BY team_location";
					
					// execute the query
					$result = executeQuery($query);
				?>
				
				<div class="control-group">
					<label class="control-label" for="homeTeam">
						Home Team
					</label>
					<div class="controls">
						<select name="homeTeam" class="chzn-select" data-placeholder="Home Team">
								<option value="-1"></option>
							<?php
								
								// populate the table
								while ($row = mysql_fetch_array($result)) {
							?>
								<option value="<?php echo $row['team_id'] ?>"><?php echo $row['team_location'] . " " . $row['team_name'] ?></option>
							<?php
								}
							?>
						</select>
					</div>
				</div>
			
				<?php
				
					// ------------------------------- AWAY TEAM SELECT ---------------------------------- //
					
					// execute the query
					$result = executeQuery($query);
				?>
				
				<div class="control-group">
					<label class="control-label" for="awayTeam">
						Away Team
					</label>
					<div class="controls">
						<select id="awayTeam" name="awayTeam" class="chzn-select" data-placeholder="Away Team">
								<option value="-1"></option>
							<?php
								
								// populate the table
								while ($row = mysql_fetch_array($result)) {
							?>
								<option value="<?php echo $row['team_id'] ?>"><?php echo $row['team_location'] . " " . $row['team_name'] ?></option>
							<?php
								}
							?>
						</select>
					</div>
				</div>
			
				<?php
				
					// ------------------------------- STADIUM SELECT ---------------------------------- //
						
					// define the query
					$query =	"SELECT stadium_id, stadium_name
								 FROM NFL_STADIUM
								 ORDER BY stadium_name";
					
					// execute the query
					$result = executeQuery($query);
				?>
				
				<div class="control-group">
					<label class="control-label" for="stadium">
						Stadium
					</label>
					<div class="controls">
						<select name="stadium" class="chzn-select" data-placeholder="Stadium">
								<option value="-1"></option>
							<?php
								
								// populate the table
								while ($row = mysql_fetch_array($result)) {
							?>
								<option value="<?php echo $row['stadium_id'] ?>"><?php echo $row['stadium_name'] . " " . $row['team_name'] ?></option>
							<?php
								}
							?>
						</select>
					</div>
				</div>
				
				<?php // ------------------------------- DATE SELECT ---------------------------------- // ?>
				
				<div class="control-group">
					<label class="control-label" for="date">Date</label>
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-calendar"></i></span>
							<input class="datepicker" type="text" name="date" id="date" placeholder="Date" />
						</div>
					</div>
				</div>
				
				<?php // ------------------------------- TIME SELECT ---------------------------------- // ?>
				
				
				<div class="control-group">
					<label class="control-label" for="time">Time</label>
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-time"></i></span>
							<input class="timepicker" type="text" name="time" id="time" placeholder="Time"/>
						</div>
					</div>
				</div>
				
				<?php // ------------------------------- SUBMIT ---------------------------------- // ?>
				
				<div class="control-group">
					<div class="controls">
						<button name="submit" class="btn" type="submit">Submit</button>
					</div>
				</div>
			</form>
			
			<script>
				$('.chzn-select').chosen();
			</script>
		<?php } ?>
<?php

include('./setup_timepicker.inc');
include('./setup_datepicker.inc');
include('./footer.inc'); //Include the HTML footer.

?>
