<?php # Script 3.11 - register.php

// include website constants and functions
include('./constants.inc');
include('./functions.inc');

//Set the page title and include the HTML header.
$page_url = $HOME_URL;
$nav_active = $HOME_URL;
include('./header.inc');
?>

        <h1><?php echo $SITE_NAME . " " . $HOME_HEADER ?></h1>
        <?php if (isset($error_msg)) { ?>
        	<h4 class="text-error"><?php echo $error_msg; ?></h4>
        <?php } ?>
        <?php if (isset($success_msg)) { ?>
        	<h4 class="text-success"><?php echo $success_msg; ?></h4>
        <?php } ?>

		<div class="imgwell span6" style="float: none; padding: 20px;">
			<table>
				<tr>
					<td>
						<div class="well">
							<h3>Check out these plays!</h3>
						</div>
					<td>
				<tr>
				</tr>
					<td>
						<iframe width="560" height="315" src="http://www.youtube.com/embed/EtZWsgwl1I4" frameborder="0" allowfullscreen></iframe>
					</td>
				</tr>
			</table>
		</div>
     
<?php
include('./footer.inc'); //Include the HTML footer.

?>