<?php # Script 3.11 - register.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $EDIT_PLAYER_URL;
$nav_active = $ADMIN;
include('./header.inc');
?>

		<?php if (!(isset($_SESSION['user']))) { ?>
			<script>
				window.location = './index.php';
			</script>
		<? } ?>
        
        <?php if (isset($_REQUEST['submit']) || isset($_REQUEST['editSubmit'])) {
		
				if (isset($_REQUEST['contract_id'])) {
					$contract_id = $_REQUEST['contract_id'];
				}
			
				// obtain input parameters
				if ($_REQUEST['player'] != -1) {
					$player = $_REQUEST['player'];
					$player_valid = TRUE;
				} else {
					echo "<p>No player was entered.</p>";
					$player_valid = FALSE;
				}
				if ($_REQUEST['number'] != -1) {
					$number = $_REQUEST['number'];
					$number_valid = TRUE;
				} else {
					echo "<p>No number was entered.</p>";
					$number_valid = FALSE;
				}
				if ($_REQUEST['year'] != -1) {
					$year = $_REQUEST['year'];
					$year_valid = TRUE;
				} else {
					echo "<p>No year was entered.</p>";
					$year_valid = FALSE;
				}
				if ($_REQUEST['team'] != -1) {
					$team = $_REQUEST['team'];
					$team_valid = TRUE;
				} else {
					echo "<p>No team was entered.</p>";
					$team_valid = FALSE;
				}
				if ($_REQUEST['position'][0] != "") {
					$positions = $_REQUEST['position'];
					$positions_valid = TRUE;
				} else {
					$positions_valid = FALSE;
				}
				if ($_REQUEST['salary'] != "") {
					$salary = $_REQUEST['salary'];
					$salary_valid = TRUE;
				} else {
					echo "<p>No salary was entered.</p>";
					$salary_valid = FALSE;
				}
				
				if ($player_valid && $year_valid && $team_valid && $salary_valid && $number_valid && $positions_valid) {
						
					if (isset($_REQUEST['submit'])) {
					
						// define the query
						$query = "INSERT INTO NFL_CONTRACT (CONTRACT_SALARY, CONTRACT_YEAR, TEAM_ID, PERSON_ID, PERSON_NUMBER)
									VALUES (" . $salary . ", '" . $year . "', " . $team . ", " . $player . ", " . $number . ");";
									
						// execute query, populates $result
						$result = executeQuery($query);
						
						foreach ($positions as $position) {
							// define the query
							$query = "INSERT INTO NFL_PLAYER_POSITION (CONTRACT_ID, POSITION_ID)
										VALUES ((SELECT contract_id
												 FROM NFL_CONTRACT
												 WHERE contract_salary = " . $salary . "
													AND contract_year = " . $year . "
													AND team_id = " . $team . "
													AND person_id = " . $player . "
													AND person_number = " . $number . "),
												" . $position . ");";
										
							// execute query, populates $result
							$result = executeQuery($query);
						}
						
					} else if (isset($_REQUEST['editSubmit'])) {
					
						$query = "SELECT COUNT(position_id) as position_count
								  FROM NFL_POSITION;";
								  
						$result = executeQuery($query);
						
						if ($row = mysql_fetch_array($result)) {
							$num_positions = $row['position_count'];
						}
					
						// define the query
						$query = "UPDATE NFL_CONTRACT SET CONTRACT_SALARY = " . $salary . ",
														CONTRACT_YEAR = " . $year . ",
														TEAM_ID = " . $team . ",
														PERSON_ID = " . $player . ",
														PERSON_NUMBER = " . $number . "
								  WHERE CONTRACT_ID = " . $contract_id . "
								  LIMIT 1;";
									
						// execute query, populates $result
						executeQuery($query);
						
						$query = "DELETE FROM NFL_PLAYER_POSITION
									WHERE CONTRACT_ID = " . $contract_id . "
									LIMIT " . $num_positions . ";";
									
						executeQuery($query);
						
						foreach ($positions as $position) {
							// define the query
							$query = "INSERT INTO NFL_PLAYER_POSITION (CONTRACT_ID, POSITION_ID)
										VALUES ((SELECT contract_id
												 FROM NFL_CONTRACT
												 WHERE contract_salary = " . $salary . "
													AND contract_year = " . $year . "
													AND team_id = " . $team . "
													AND person_id = " . $player . "
													AND person_number = " . $number . "),
												" . $position . ");";
										
							// execute query, populates $result
							executeQuery($query);
						}
					}
		?>
		
			<h3>Added Player Contract:</h3>
			<table class="table">
				<tr>
					<td>
						Player: <?php echo $player; ?>
					</td>
				</tr>
				<tr>
					<td>
						Year: <?php echo $year; ?>
					</td>
				</tr>
				<tr>
					<td>
						Team: <?php echo $team; ?>
					</td>
				</tr>
				<tr>
					<td>
						Salary: <?php echo $salary; ?>
					</td>
				</tr>
				<tr>
					<td>
						Position(s): <?php foreach ($positions as $position) { echo $position . " ";} ?>
					</td>
				</tr>
			</table>
			
			
		<?php }} else {
		
			$PERSON_ID = -1;
			$PERSON_NUM = -1;
			$YEAR = -1;
			$TEAM_ID = -1;
			$SALARY = "";
			$POSITION_ID = array();
			
			if (isset($_REQUEST['edit'])) {
				$contract_id = $_REQUEST['contract_id'];
				$query = "SELECT person_id, person_number, contract_year, team_id, contract_salary, position_id
							FROM NFL_CONTRACT
								JOIN NFL_PLAYER_POSITION ON NFL_CONTRACT.contract_id = NFL_PLAYER_POSITION.contract_id
								WHERE NFL_CONTRACT.contract_id = " . $contract_id . ";";
								
				$result = executeQuery($query);
				
				$i = 1;
				while ($row = mysql_fetch_array($result)) {
					$PERSON_ID = $row['person_id'];
					$PERSON_NUM  = $row['person_number'];
					$YEAR  = $row['contract_year'];
					$TEAM_ID = $row['team_id'];
					$SALARY = substr($row['contract_salary'], 0 , -3);
					$POSITION_ID[$i] = $row['position_id'];
					$i++;
				}
				echo "<h1>" . $EDIT_CONTRACT_HEADER . "</h1>";
			} else {
				if (isset($_REQUEST['person_id'])) {
					$PERSON_ID = $_REQUEST['person_id'];
				}
				echo "<h1>" . $ADD_CONTRACT_HEADER . "</h1>";
			}
		
		?>
		
		<form class="form-horizontal" action="<? echo $EDIT_CONTRACT_URL; ?>">
			<h4><?php echo $header; ?></h4>

                <?php
                
                    // ------------------------------- CONTRACT PLAYER SELECT ---------------------------------- //
                        
                    // define the query
                    $query =	"SELECT person_id, person_first_name, person_last_name
                                 FROM NFL_PERSON
                                 ORDER BY person_last_name";
                    
                    // execute the query
                    $result = executeQuery($query);
                ?>
                
                <div class="control-group">
                    <label class="control-label" for="player">
                        Player
                    </label>
                    <div class="controls">
                        <select name="player" class="chzn-select" data-placeholder="Player"">
                                <option value="-1"></option>
                            <?php
                                
                                // populate the table
                                while ($row = mysql_fetch_array($result)) {
                            ?>
                                <option value="<?php echo $row['person_id'] ?>" <?php if ($PERSON_ID == $row['person_id']) {echo "selected=\"selected\"";} ?>><?php echo $row['person_first_name'] . " " . $row['person_last_name'] ?></option>
                            <?php
                                }
                            ?>
                        </select>
                    </div>
                </div>
		
				<?php
                
                    // ------------------------------- NUMBER SELECT ---------------------------------- //
                    
                ?>
                
                <div class="control-group">
                    <label class="control-label" for="number">
                        Number
                    </label>
                    <div class="controls">
                        <select name="number" class="chzn-select" data-placeholder="Number">
                                <option value="-1"></option>
                            <?php
                                
                                // populate the table
                                foreach (range(1, 99) as $number) {
                            ?>
                                <option value="<?php echo $number; ?>" <?php if ($PERSON_NUM == $number) {echo "selected=\"selected\"";} ?>><?php echo $number; ?></option>
                            <?php
                                }
                            ?>
                        </select>
                    </div>
                </div>
		
				<?php
                
                    // ------------------------------- CONTRACT YEAR INPUT ---------------------------------- //
                    
                ?>
                
                <div class="control-group">
                    <label class="control-label" for="year">
                        Year
                    </label>
                    <div class="controls">
                        <select name="year" class="chzn-select" data-placeholder="Year">
                                <option value="-1"></option>
                            <?php
                                
                                // populate the table
                                foreach (range(1966, (int)date('Y')) as $year) {
                            ?>
                                <option value="<?php echo $year; ?>" <?php if ($YEAR == $year) {echo "selected=\"selected\"";} ?>><?php echo $year; ?></option>
                            <?php
                                }
                            ?>
                        </select>
                    </div>
                </div>
		
				<?php
                
				// ------------------------------- TEAMS SELECT ---------------------------------- //
					
				// define the query
				$query =	"SELECT conference_abbr, division_name, team_id, team_name, team_location
							 FROM NFL_TEAM
								JOIN NFL_DIVISION ON NFL_DIVISION.division_id = NFL_TEAM.division_id
								JOIN NFL_CONFERENCE ON NFL_CONFERENCE.conference_id = NFL_DIVISION.conference_id
							 ORDER BY conference_abbr, division_name;";
				
				// execute the query
				$result = executeQuery($query);
						
                ?>
                
                <div class="control-group">
                    <label class="control-label" for="team">
                        Team
                    </label>
                    <div class="controls">
                        <select name="team" class="chzn-select" data-placeholder="Choose Team">
                            <option value="-1"></option>
							<?php
            
                            // test variable for next division
                            $division = "DIVISION";
                            
                            // test for first group for closed tags
                            $first_opgroup = 1;
                            
                            // populate the table
                            while ($row = mysql_fetch_array($result)) {
                                if ($division != $row['conference_abbr'] . " " . $row['division_name']) {
                                    if (!$first_optgroup) {
                                        echo "</optgroup>";
                                        $first_opgroup = 0;
                                    }
                                    $division = $row['conference_abbr'] . " " . $row['division_name'];
                                    echo "<optgroup label=\"" . $division . "\">";
                                }
                            ?>
                                <option value="<?php echo $row['team_id'] ?>" <?php if ($TEAM_ID == $row['team_id']) {echo "selected=\"selected\"";} ?>><?php echo $row['team_location'] . " " . $row['team_name']; ?></option>
                            <?php
                                }
                            ?>
                            </optgroup>
                        </select>
                    </div>
                </div>
		
				<?php
                
				// ------------------------------- POSIITION SELECT ---------------------------------- //
					
				// define the query
				$query =	"SELECT position_id, position_name
							 FROM NFL_POSITION
							 ORDER BY position_name";
				
				// execute the query
				$result = executeQuery($query);
				
                ?>
                
                <div class="control-group">
                    <label class="control-label" for="position[]">
                        Position(s)
                    </label>
                    <div class="controls">
                        <select name="position[]" class="chzn-select" multiple data-placeholder="Choose Position(s)">
                                <option value="-1"></option>
                            <?php
                                
                                // populate the table
                                while ($row = mysql_fetch_array($result)) {
                            ?>
                                <option value="<?php echo $row['position_id'] ?>" <?php if (in_array($row['position_id'], $POSITION_ID)) {echo "selected=\"selected\"";} ?>><?php echo $row['position_name']; ?></option>
                            <?php
                                }
                            ?>
                        </select>
                    </div>
                </div>

                <?php
                
                    // ------------------------------- CONTRACT SALARY INPUT ---------------------------------- //
                    
                ?>

                <div class="control-group">
                    <label class="control-label" for="salary">
                        Salary
                    </label>
                    <div class="controls">
                        <div class="input-prepend input-append">
                                <span class="add-on">$</span>
                                <input name="salary" type="text" placeholder="Salary" value="<?php echo $SALARY; ?>">
                                <span class="add-on">.00</span>
                        </div>
                    </div>
                </div>
				
				
				<?php // ------------------------------- SUBMIT ---------------------------------- // ?>
                
				<?php if (isset($_REQUEST['edit'])) { ?>
				
					<input name="contract_id" type="hidden" value="<?php echo $_REQUEST['contract_id']; ?>" />
					<div class="control-group">
						<div class="controls">
							<button name="editSubmit" class="btn" type="submit">Submit</button>
						</div>
					</div>
				
				<?php } else { ?>
				
					<div class="control-group">
						<div class="controls">
							<button name="submit" class="btn" type="submit">Submit</button>
						</div>
					</div>
				
				<?php } ?>
		</form>
			
		<script>
			$('.chzn-select').chosen();
			$('#add_contract_header').hide();
		</script>
        
        <?php } ?>

<?php

include('./footer.inc'); //Include the HTML footer.

?>
