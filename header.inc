<?php
	session_start();
	if (isset($_REQUEST['logout'])) {
		unset($_SESSION['user']);
		$success_msg = "Successfully logged out.";
	}
	if (isset($_REQUEST['loginSubmit'])) {
		$username = $_REQUEST['username'];
		$password = $_REQUEST['password'];
		
		$query = "SELECT user_id
					FROM NFL_USER
					WHERE user_name = '" . $username . "'
						AND user_password = '" . $password . "';";
								
		$result = executeQuery($query);
		
		if ($row = mysql_fetch_array($result)) {
			$_SESSION['user'] = $_REQUEST['username'];
			$success_msg = "Successfully logged in as " . $_REQUEST['username'] . ".";
		} else {
			$error_msg = "Incorrect login.  Try Again.";
		}
	}
	if (isset($_SESSION['user'])) {
		$user = $_SESSION['user'];
	}
	
?>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="<?php echo $CSS; ?>">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.min.css">
    <link rel="stylesheet" type="text/css" href="./css/datepicker.css">
    <link rel="stylesheet" type="text/css" href="./css/timepicker.css">
    <link rel="stylesheet" type="text/css" href="./css/chosen.css">

    <script src="./js/jquery-1.8.2.min.js"></script>
    <script src="./js/jquery.quicksearch.js"></script>
    <script src="./js/bootstrap-datepicker.js"></script>
    <script src="./js/bootstrap-timepicker.js"></script>
    <script src="./js/chosen.jquery.js"></script>
    <script src="./js/bootstrap.min.js"></script>
	<title><?php echo $SITE_NAME . " - " . $NAV_BAR_ITEMS[$page_url]; ?></title>
  </head>
  <body <?php if ($nav_search) echo "onload=\"$('input#nav_search').trigger('keyup'); $('input#nav_search').focus();\"" ?>>
    
    <div class="row-fluid">
      <div class="navbar span10 offset1">
        <div class="navbar-inner">

            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

            <a class="brand" href="#"><?php echo $SITE_NAME; ?></a>

            <div class="nav-collapse collapse">
              <ul class="nav">
              <?php foreach($NAV_BAR_ITEMS as $url => $title) { ?>
                <li <?php echoActive($url, $nav_active); ?>>
                  <a href="<?php echo $url; ?>"><?php echo $title; ?></a>
                </li>
              <?php } ?>
              <?php if (!(isset($user))) { ?>
                <li>
                  <a data-toggle="modal" href="#myModal">Login</a>
                </li>
              <?php } else  { ?>
                <li class="dropdown">
                    	<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i>&nbsp;<?php echo $user; ?><span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                            <?php foreach($ADMIN_NAV_BAR_ITEMS as $url => $title) { ?>
                                <li <?php echoActive($url, $page_url); ?>>
                                	<a href="<?php echo $url; ?>"><?php echo $title; ?></a>
                                </li>
                            <?php } ?>
                            <li>
                            	<a href="<?php echo $HOME_URL . "?logout=" ?>"></span><?php echo $LOGOUT_TITLE; ?></a>
                            </li>
                        </ul>
                </li>
              <?php } ?>
              </ul>
              <?php if ($nav_search) { ?>
              <div class="navbar-form pull-right">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-search"></i></span>
                    <input id="nav_search" type="text" />
                </div>
              </div>
              <?php } ?>
            </div>
        </div>
      </div>
    </div>
	
	<?php if (!(isset($user))) { ?>
    
        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3 id="myModalLabel">NFL Stats Login</h3>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" action=<?php echo $HOME_URL; ?>>
                <div class="control-group">
                    <label class="control-label" for="inputUsername">
                        Username
                    </label>
                    <div class="controls">
                        <input type="text" name="username" placeholder="Username" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">
                        Password
                    </label>
                    <div class="controls">
                        <input type="password" name="password" placeholder="Password" />
                    </div>
                </div>
          </div>
          <div class="modal-footer">
            <button class="btn" data-dismiss="modal">Close</button>
            <button class="btn btn-primary" type="submit" name="loginSubmit">Login</button>
          </div>
          </form>
        </div>
    
    <?php } ?>
	
    <?php if ($CSS == $ORIG) { ?>
	<div class="container">
    <?php } else if ($CSS == $ALT) { ?>
	<div class="container well trim trim-striped">
	  <div class="well flush-bottom">
    <?php }?>
	
	<!-- PAGE SPECIFIC CONTENT STARTS HERE. -->
