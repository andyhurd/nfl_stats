<?php # Script 3.11 - register.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $EDIT_PLAYER_GAME_STATS_URL;
$nav_active = $ADMIN;
include('./header.inc');
?>
		<?php if (!(isset($_SESSION['user']))) { ?>
			<script>
				window.location = './index.php';
			</script>
		<? } ?>
        
    	<h1><?php echo $ADD_PLAYER_GAME_STATS_HEADER ?></h1>
        
		
		<?php 
			$submit = $_REQUEST['submit'];
			if (isset($submit)){
				if ($_REQUEST['player'] != -1) {
					$player_id = $_REQUEST['player'];
					$player_valid = TRUE;
				} else {
					echo "<p>No player was entered.</p>";
					$player_valid = FALSE;
				}
				if ($_REQUEST['team'] != -1) {
					$team_id = $_REQUEST['team'];
					$team_valid = TRUE;
				} else {
					echo "<p>No home team was entered.</p>";
					$team_valid = FALSE;
				}
				if ($_REQUEST['game'] != -1) {
					$gameID = $_REQUEST['game'];
					$game_valid = TRUE;
				} else {
					echo "<p>No home team was entered.</p>";
					$game_valid = FALSE;
				}
				if ($player_id == -1 || $team_id == -1 || $gameID == -1){
					echo "Player, Team and Game are required!";
				} else {
					$query = "SELECT category_desc, stat_abbr, stat_desc
                             FROM NFL_CATEGORY
							 	JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id";
								
						$result = executeQuery($query);
                
						while ($row = mysql_fetch_array($result)) {
							$var = $_REQUEST[$row['stat_desc'] . "-" . $row['category_desc']];
							if ($var == ""){
								$var = 0;
							}
							/*
							$query2 = "INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
										VALUES ( ".$gameID . ",
											(SELECT CONTRACT_ID
											 FROM NFL_CONTRACT
											 WHERE (TEAM_ID = " . $home_team_id . "
													OR TEAM_ID = " . $away_team_id . ")
													AND PERSON_ID = " . $player_id . "), ".
											"(SELECT CATEGORY_STAT_ID " .
											" FROM NFL_CATEGORY_STAT ". 
											"	INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id ".
											"	INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id".
											" WHERE STAT_ABBR = \"".$row['stat_abbr']."\"".
											" AND CATEGORY_DESC = \"".$row['category_desc']."\"),"
											.$var.
										");";
							*/
							// ---------------------- MAYBE FIXED ------------------------//
							
							$query2 = "INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
										VALUES ( ".$gameID . ",
											(SELECT CONTRACT_ID
											 FROM NFL_CONTRACT
											 WHERE TEAM_ID = " . $team_id . "
													AND PERSON_ID = " . $player_id . "
													AND CONTRACT_YEAR = (SELECT DATE_FORMAT(game_time, '%Y')
																		FROM NFL_GAME
																		WHERE game_id = " . $gameID . ")), " . 
											"(SELECT CATEGORY_STAT_ID " .
											" FROM NFL_CATEGORY_STAT ". 
											"	INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id ".
											"	INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id".
											" WHERE STAT_ABBR = \"".$row['stat_abbr']."\"".
											" AND CATEGORY_DESC = \"".$row['category_desc']."\"),"
											.$var.
										");";
								//echo $query2 . "<br/>";
							executeQuery($query2);	
							

						}
						echo "Player Game Stat added";
				}
					
			} else {
		?>
		
		
        <form class="form-horizontal">
			
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
                        <select name="player" class="chzn-select" data-placeholder="Player">
                                <option value="-1"></option>
                            <?php
                                // populate the table
                                while ($row = mysql_fetch_array($result)) {
                            ?>
                                <option value="<?php echo $row['person_id'] ?>"><?php echo $row['person_first_name'] . " " . $row['person_last_name'] ?></option>
                            <?php
                                }
                            ?>
                        </select>
                    </div>
                </div>
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
					<label class="control-label" for="team">
						Team
					</label>
					<div class="controls">
						<select name="team" class="chzn-select" data-placeholder="Players Team">
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
				
					// ------------------------------- Game Finder ---------------------------------- //
					$query = "SELECT game_id, team_id_home, team_id_visiting, game_time
								FROM NFL_GAME;";
					
					
					// execute the query
					$result = executeQuery($query);
				?>
				
				<div class="control-group">
					<label class="control-label" for="game">
						Game
					</label>
					<div class="controls">
						<select id="game" name="game" class="chzn-select" data-placeholder="Game">
								<option value="-1"></option>
							<?php
								
								// populate the table
								while ($row = mysql_fetch_array($result)) {
									$home_id_query = "SELECT team_name
													FROM NFL_TEAM
													WHERE team_id = " . $row['team_id_home'] . ";";
									$home_name = executeQuery($home_id_query);
									$home_team_name = mysql_fetch_array($home_name);
									$away_id_query = "SELECT team_name
													FROM NFL_TEAM
													WHERE team_id = " . $row['team_id_visiting'] . ";";
									$away_name = executeQuery($away_id_query);
									
									$away_team_name = mysql_fetch_array($away_name);
							?>
								<option value="<?php echo $row['game_id']; ?>"><?php echo $home_team_name['team_name'] . " @ " . $away_team_name['team_name'] . " on " . $row['game_time']; ?></option>
							<?php
								}
							?>
						</select>
					</div>
				</div>
			<?php if (false) {
            
                // define the query
                $query =	"SELECT category_desc, stat_abbr, stat_desc
                             FROM NFL_CATEGORY
							 	JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id";
                
                // execute the query
                $result = executeQuery($query);
				
				// category tracking var
				$category = "CATEGORY";
				
				$first_category = 1;
								
				// populate the table
				while ($row = mysql_fetch_array($result)) {
					if ($category != $row['category_desc']) {
						if ($first_category == 0) {
			?>
            
            
                                </div>
                            </div>
                       </div>
                   </div>
               </div>
               
               			<?php
                        }
						$first_category = 0;
						?>
            
                <div class="control-group">
                    <div class="accordian" id="accordian">
                        <div class="accordian-group">
                            <div class="accordian-heading">
                                <div class="control-group">
                                    <a class="accordian-toggle" data-toggle="collapse" data-parent="accordian" href="#<?php echo $row['category_desc']; ?>Collapse">
                                        <div class="controls">
                                            <h3><?php echo $row['category_desc']; ?></h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div id="<?php echo $row['category_desc']; ?>Collapse" class="accordian-body collapse">
                                <div class="accordian-inner">
            
				<?php
                            $category = $row['category_desc'];
                        } 
                ?>
                                    <div class="control-group">
                                        <label class="control-label" for="<?php echo $row['stat_desc']; ?>">
                                            <?php echo $row['stat_desc']; ?>
                                        </label>
                                        <div class="controls">
                                            <input name="<?php echo $row['stat_desc']; ?>" type="text" placeholder="<?php echo $row['stat_desc']; ?>" />
                                        </div>
                                    </div>
			<?php } ?>
            
            
            
            

			<?php } else { // START OF GIGANTIC ELSE BLOCK
            
                // define the query
                $query =	"SELECT category_desc, stat_abbr, stat_desc
                             FROM NFL_CATEGORY
							 	JOIN NFL_CATEGORY_STAT ON NFL_CATEGORY_STAT.category_id = NFL_CATEGORY.category_id
								JOIN NFL_STAT ON NFL_STAT.stat_id = NFL_CATEGORY_STAT.stat_id";
                
                // execute the query
                $result = executeQuery($query);
								
				// populate the table
				while ($row = mysql_fetch_array($result)) {
					if ($category != $row['category_desc']) {
			?>
                        <div class="control-group">
                            <div class="controls">
                                <h3><?php echo $row['category_desc']; ?></h3>
                            </div>
                        </div>
            
				<?php
                            $category = $row['category_desc'];
                        } 
                ?>
                        <div class="control-group">
                            <label class="control-label" for="<?php echo $row['stat_desc']; ?>">
                                <?php echo $row['stat_desc']; ?>
                            </label>
                            <div class="controls">
                                <input name="<?php echo $row['stat_desc'] . "-" . $row['category_desc']; ?>" type="text" placeholder="<?php echo $row['stat_desc']; ?>" />
                            </div>
                        </div>
			<?php } ?>
			<?php // ------------------------------- SUBMIT ---------------------------------- // ?>
			
			<div class="control-group">
				<div class="controls">
					<button name="submit" class="btn" type="submit">Submit</button>
				</div>
			</div>
			
            <?php }
				}// END OF GIGANTIC ELSE BLOCK // ?>
			
			
        </form>
			
		<script>
			$('.chzn-select').chosen();
		</script>

<?php
include('./setup_datepicker.inc');
include('./setup_timepicker.inc');
include('./footer.inc'); //Include the HTML footer.

?>
