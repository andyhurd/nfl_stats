<?php # players.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

// set the page title, active_tab and include the HTML header.
$page_url = $PLAYERS_URL;
$nav_active = $PLAYERS_URL;
$nav_search = 1;
include('./header.inc');
?>
    
    	<h1><?php echo $PLAYERS_HEADER ?></h1>
    	<div class="pagination pagination-small pagination-centered">
        	<ul>
				<?php
                foreach (range('A', 'Z') as $letter) { ?>
                	<li <?php echoActive($active_letter, $letter); ?>><a href="<?php echo $_SERVER['PHP_SELF'] . "?letter=" . $letter . "\">" . $letter; ?></a></li>
                <?php } ?>
			</ul>
        </div>
		
			<?php
            
                // obtain active letter parameter
                $active_letter = $_REQUEST['letter'];
				$submit = $_REQUEST['submit'];
                
                if (isset($active_letter)) {
				
				echo "<table class=\"table row-fluid table-hover table-condensed table-striped\"><tbody>";
					
					/*
                $query =	"SELECT NFL_PERSON.person_id, person_first_name, person_last_name, position_abbr
                             FROM NFL_PERSON
                                JOIN NFL_CONTRACT ON NFL_CONTRACT.person_id = NFL_PERSON.person_id
                                JOIN NFL_PLAYER_POSITION ON NFL_PLAYER_POSITION.contract_id = NFL_CONTRACT.contract_id
                                JOIN NFL_POSITION ON NFL_POSITION.position_id = NFL_PLAYER_POSITION.position_id
                             WHERE person_last_name LIKE '" . $active_letter . "%'" .
                                " AND NFL_CONTRACT.contract_year = 2012";*/
                
                // define the query
                $query =	"SELECT NFL_PERSON.person_id, person_first_name, person_last_name
                             FROM NFL_PERSON
                             WHERE person_last_name LIKE '" . $active_letter . "%'
							 ORDER BY person_last_name";
							 
                
                // execute query, populates $result
                $result = executeQuery($query);
				
                // populate the table
                while ($row = mysql_fetch_array($result)) {
					$player_link = $PLAYER_URL . "?person_id=" . $row['person_id'];
            ?>
        
            	<tr>
                	<td onClick="location.href='<?php echo $player_link; ?>'">
                    	<?php echo $row['person_first_name'] . " " . $row['person_last_name'] . "\n"; ?>
                    </td>
                </tr>
                
        	<?php } ?>
			</tbody></table>
        <?php } else if (isset($submit)) {
				
				echo "<table class=\"table row-fluid table-hover table-condensed table-striped\"><tbody>";
				
                // define the query
				
                $query =	"SELECT NFL_PERSON.person_id, person_first_name, person_last_name
							 FROM NFL_PERSON
								INNER JOIN NFL_CONTRACT ON NFL_CONTRACT.person_id = NFL_PERSON.person_id
								INNER JOIN NFL_PLAYER_POSITION ON NFL_PLAYER_POSITION.contract_id = NFL_CONTRACT.contract_id
							WHERE ";
				
				$firstName = $_REQUEST['inputFirstName'];
				$lastName = $_REQUEST['inputLastName'];
				$salaryRel1 = $_REQUEST['salary_relative1'];
				$salaryRel2 = $_REQUEST['salary_relative2'];
				$salary1 = $_REQUEST['salary1'];
				$salary2 = $_REQUEST['salary2'];
				$salary1 = $_REQUEST['salary1'];
				$positions = $_REQUEST['position'];
				$teams = $_REQUEST['teams'];
				
				$firstOption = true;
				
				if ($firstName != ""){
					$firstOption = false;
					$query = $query . "NFL_PERSON.person_first_name LIKE \"" . $firstName . "\" ";
				}
				
				if ($lastName != ""){
					if($firstOption == false){
						$query = $query . " AND ";
					} else {
						$firstOption = false;
					}
					
					$query = $query . "NFL_PERSON.person_last_name LIKE \"" . $lastName . "\" ";
				}

				if ($salaryRel1 != "1" && $salary1 != ""){
					if($firstOption == false){
						$query = $query . " AND ";
					} else {
						$firstOption = false;
					}
					$query = $query . "NFL_CONTRACT.contract_salary ";
					if ($salaryRel1 == "2"){
						$query = $query . "< ";
					} else {
						$query = $query . "> ";
					}
					$query = $query . $salary1;
				}
				
				if ($salaryRel2 != "1" && $salary2 != ""){
					if($firstOption == false){
						$query = $query . " AND ";
					} else {
						$firstOption = false;
					}
					$query = $query . "NFL_CONTRACT.contract_salary ";
					if ($salaryRel2 == "2"){
						$query = $query . "< ";
					} else {
						$query = $query . "> ";
					}
					$query = $query . $salary2;
				}
				
				if ($positions[0] != ""){
					if($firstOption == false){
						$query = $query . " AND ";
					} else {
						$firstOption = false;
					}
					$notFirst = false;
					foreach($positions as $pos){
						if ($notFirst == true){
							$query = $query . " OR ";
						} else {
							$notFirst = true;
							$query = $query . " ( ";
						}
						
						$query = $query . "NFL_PLAYER_POSITION.position_id = " . $pos;
					}
					$query = $query . " ) ";
				}
				
				/*$query .= " GROUP BY NFL_PERSON.person_id, NFL_PERSON.person_first_name, NFL_PERSON.person_last_name ";*/
				
				if ($teams[0] != ""){
					if($firstOption == false){
						$query = $query . " AND ";
					} else {
						$firstOption = false;
					}
					$notFirst = false;
					foreach($teams as $team){
						if ($notFirst == true){
							$query = $query . " OR ";
						} else {
							$notFirst = true;
							$query = $query . " ( ";
						}
						
						$query = $query . "NFL_CONTRACT.team_id = " . $team;
					}
					$query = $query . " ) ";
				}
				
				$query .= " GROUP BY NFL_PERSON.person_id, NFL_PERSON.person_first_name, NFL_PERSON.person_last_name ";
				$query = $query . " ORDER BY NFL_PERSON.person_last_name;";
				
				
                if ($firstOption == false){
					// execute query, populates $result
					$result = executeQuery($query);
					
					// populate the table
					while ($row = mysql_fetch_array($result)) {
						$player_link = $PLAYER_URL . "?person_id=" . $row['person_id'];

            ?>
        
            	
                <tr>
                	<td onClick="location.href='<?php echo $player_link; ?>'">
                    	<?php echo $row['person_first_name'] . " " . $row['person_last_name'] . "\n"; ?>
                    </td>
                </tr>
                
        	<?php }
			
				echo "</tbody></table>";
				} else {
					echo "No Search Params Entered";
				}			?>
		<?php } else { ?>
        	<form class="form-horizontal">
                <h4>Player Search</h4>
                <br />
                
                <div class="control-group">
                    <label class="control-label" for="inputFirstName">
                        First Name
                    </label>
                    <div class="controls">
                        <input type="text" name="inputFirstName" placeholder="First Name" />
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="inputLastName">
                        Last Name
                    </label>
                    <div class="controls">
                        <input type="text" name="inputLastName" placeholder="Last Name" />
                    </div>
                </div>
				
                <div class="control-group">
                    <label class="control-label" for="salary1">
                        Salary
                    </label>
                    <div class="controls">
                        <select name="salary_relative1" placeholder="less/greater than">
                            <option value="1"></option>
                            <option value="2">less than</option>
                            <option value="3">greater than</option>
                        </select>
                        <div class="input-prepend input-append">
                                <span class="add-on">$</span>
                                <input name="salary1" type="text" placeholder="Salary" />
                                <span class="add-on">.00</span>
                        </div>
                    </div>
                    <br />
                    <div class="controls">
                        <select name="salary_relative2" placeholder="less/greater than">
                            <option value="1"></option>
                            <option value="2">less than</option>
                            <option value="3">greater than</option>
                        </select>
                        <div class="input-prepend input-append">
                                <span class="add-on">$</span>
                                <input name="salary2" type="text" placeholder="Salary" />
                                <span class="add-on">.00</span>
                        </div>
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
                                <option value="<?php echo $row['position_id'] ?>"><?php echo $row['position_name']; ?></option>
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
								JOIN NFL_STADIUM ON NFL_TEAM.stadium_id = NFL_STADIUM.stadium_id
							 ORDER BY conference_abbr, division_name;";
				
				// execute the query
				$result = executeQuery($query);
						
                ?>
                
                <div class="control-group">
                    <label class="control-label" for="teams[]">
                        Team(s)
                    </label>
                    <div class="controls">
                        <select name="teams[]" class="chzn-select" multiple data-placeholder="Choose Team(s)">
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
                                <option value="<?php echo $row['team_id'] ?>"><?php echo $row['team_location'] . " " . $row['team_name']; ?></option>
                            <?php
                                }
                            ?>
                            </optgroup>
                        </select>
                    </div>
                </div>
				
				<?php // ------------------------------- SUBMIT ---------------------------------- // ?>
				
				<div class="control-group">
					<div class="controls">
						<button name="submit" class="btn" type="submit">Submit</button>
					</div>
				</div>
                
            </form>
        <?php } ?>
			
		<script>
			$('.chzn-select').chosen();
		</script>
    
<?php

include('./setup_datepicker.inc');
include('./setup_timepicker.inc');
include('./setup_quicksearch.inc');
include('./footer.inc'); //Include the HTML footer.

?>