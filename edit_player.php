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
        
        
		<?php // ------------------------------------ HANDLE SUBMITTED FORM --------------------------------- //
			if (isset($_REQUEST['submit']) || isset($_REQUEST['editSubmit'])) {
		
				if (isset($_REQUEST['person_id'])) {
					$person_id = $_REQUEST['person_id'];
				}
			
				// obtain input parameters
				if ($_REQUEST['firstName'] != "") {
					$first_name = $_REQUEST['firstName'];
					$fname_valid = TRUE;
				} else {
					echo "<p>No first name was entered.</p>";
					$fname_valid = FALSE;
				}
				if ($_REQUEST['lastName'] != "") {
					$last_name = $_REQUEST['lastName'];
					$lname_valid = TRUE;
				} else {
					echo "<p>No last name was entered.</p>";
					$lname_valid = FALSE;
				}
				if ($_REQUEST['height'] != -1) {
					$height = $_REQUEST['height'];
					$height_valid = TRUE;
				} else {
					echo "<p>No height was entered.</p>";
					$height_valid = FALSE;
				}
				if ($_REQUEST['weight'] != -1) {
					$weight = $_REQUEST['weight'];
					$weight_valid = TRUE;
				} else {
					echo "<p>No weight was entered.</p>";
					$weight_valid = FALSE;
				}
				
				if ($fname_valid && $lname_valid && $height_valid && $weight_valid) {
				
					if (isset($_REQUEST['submit'])) {
						// define the query
						$query = "INSERT INTO NFL_PERSON (PERSON_HEIGHT, PERSON_WEIGHT, PERSON_FIRST_NAME, PERSON_LAST_NAME)
									VALUES (" . $height . ", " . $weight . ", '" . $first_name . "', '" . $last_name . "');";
						// execute query, populates $result
						$result = executeQuery($query);
					} else if (isset($_REQUEST['editSubmit'])){
						$query = "UPDATE NFL_PERSON 
								  SET PERSON_HEIGHT = " . $height . ",
									   PERSON_WEIGHT = " . $weight . ",
									   PERSON_FIRST_NAME = '" . $first_name . "',
									   PERSON_LAST_NAME = '" . $last_name . "'
								  WHERE PERSON_ID = " . $person_id . "
								  LIMIT 1;";
						
						executeQuery($query);
					}
		?>
		
			<h3>Added Player:</h3>
			<table class="table">
				<tr>
					<td>
						First Name: <?php echo $first_name; ?>
					</td>
				</tr>
				<tr>
					<td>
						Last Name: <?php echo $last_name; ?>
					</td>
				</tr>
				<tr>
					<td>
						Height: <?php echo $height; ?>
					</td>
				</tr>
				<tr>
					<td>
						Weight: <?php echo $weight; ?>
					</td>
				</tr>
			</table>
		<?php }} else {
		
			$PERSON_HEIGHT = -1;
			$PERSON_WEIGHT  = -1;
			$PERSON_FNAME  = "";
			$PERSON_LNAME = "";
			
			if (isset($_REQUEST['edit'])) {
				$person_id = $_REQUEST['person_id'];
				$query = "SELECT person_height, person_weight, person_first_name, person_last_name
							FROM NFL_PERSON
							WHERE person_id = " . $person_id . "
							LIMIT 1;";
								
				$result = executeQuery($query);
				
				if ($row = mysql_fetch_array($result)) {
					$PERSON_HEIGHT = $row['person_height'];
					$PERSON_WEIGHT  = $row['person_weight'];
					$PERSON_FNAME  = $row['person_first_name'];
					$PERSON_LNAME = $row['person_last_name'];
				}
				echo "<h1>" . $EDIT_PLAYER_HEADER . "</h1>";
			} else {
				echo "<h1>" . $ADD_PLAYER_HEADER . "</h1>";
			}
		?>
		
		<form class="form-horizontal" action="<? echo $EDIT_PLAYER_URL; ?>">
			<h4><?php echo $header; ?></h4>
		
			<?php
			
				// ------------------------------- NAME INPUT ---------------------------------- //
				
			?>
			
			<div class="control-group">
				<label class="control-label" for="firstName">
					First Name
				</label>
				<div class="controls">
					<input name="firstName" value="<?php echo $PERSON_FNAME; ?>" type="text" placeholder="First Name" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="lastName">
					Last Name
				</label>
				<div class="controls">
					<input name="lastName" value="<?php echo $PERSON_LNAME; ?>" type="text" placeholder="Last Name" />
				</div>
			</div>
		
			<?php
			
				// ------------------------------- HEIGHT SELECT ---------------------------------- //
				
			?>
			
			<div class="control-group">
				<label class="control-label" for="height">
					Height
				</label>
				<div class="controls">
					<select name="height" class="chzn-select" data-placeholder="Height">
							<option value="-1"></option>
						<?php
							
							// populate the table
							foreach (generateHeightArray() as $inches => $heightString) {
						?>
							<option value="<?php echo $inches; ?>" <?php if ($PERSON_HEIGHT == $inches) {echo "selected=\"selected\"";} ?>><?php echo $heightString; ?></option>
						<?php
							}
						?>
					</select>
				</div>
			</div>
		
			<?php
			
				// ------------------------------- WEIGHT SELECT ---------------------------------- //
				
			?>
			
			<div class="control-group">
				<label class="control-label" for="weight">
					Weight
				</label>
				<div class="controls">
					<select name="weight" class="chzn-select" data-placeholder="Weight">
							<option value="-1"></option>
						<?php
							
							// populate the table
							foreach (range(100, 350) as $pounds) {
						?>
							<option value="<?php echo $pounds; ?>" <?php if ($PERSON_WEIGHT == $pounds) {echo "selected=\"selected\"";} ?>><?php echo $pounds; ?></option>
						<?php
							}
						?>
					</select>
				</div>
			</div>
				
			<?php // ------------------------------- SUBMIT ---------------------------------- // ?>
                
				<?php if (isset($_REQUEST['edit'])) { ?>
				
					<input name="person_id" type="hidden" value="<?php echo $_REQUEST['person_id']; ?>" />
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
		</script>
		<?php } ?>

<?php

include('./footer.inc'); //Include the HTML footer.

?>
