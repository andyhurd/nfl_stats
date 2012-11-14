<?php # constants.php - declares constants for use across all pages

	// layout options
	$ORIG = './css/bootstrap.css';
	$ALT = './css/bootstrap_alt.css';
	
	// current layout setting
	$CSS = $ALT;

	// site name
	$SITE_NAME = 'NFL Stats';
	
	// resource locations
	$HEADER_URL = './includes/header.inc';
	$FOOTER_URL = './includes/footer.inc';
	$FUNCTIONS_URL = './includes/functions.inc';

	// page url constants
	$HOME_URL = './index.php';
	$STATISTICS_URL = './statistics.php';
	$STANDINGS_URL = './standings.php';
	$PLAYERS_URL = './players.php';
	$PLAYER_URL = './player.php';
	$TEAMS_URL = './teams.php';
	$TEAM_URL = './team.php';
	$ADMIN_URL = 'admin';
	$EDIT_CONTRACT_URL = './edit_contract.php';
	$EDIT_GAME_URL = './edit_game.php';
	$EDIT_PLAYER_URL = './edit_player.php';
	$EDIT_PLAYER_GAME_STATS_URL = './edit_player_game_stats.php';
	$EDIT_TEAM_GAME_STATS_URL = './edit_team_game_stats.php';
	$LOGOUT_URL = 'logout';
	$EXTENDED_STATISTICS_URL = './extended_statistics.php';
	
	// page title constants
	$HOME_TITLE = 'Home';
	$STATISTICS_TITLE = 'Statistics';
	$STANDINGS_TITLE = 'Standings';
	$PLAYERS_TITLE = 'Players';
	$PLAYER_TITLE = 'Player';
	$TEAMS_TITLE = 'Teams';
	$TEAM_TITLE = 'Team';
	$EDIT_CONTRACT_TITLE = 'Add Player Contract';
	$EDIT_PLAYER_TITLE = 'Add Player';
	$EDIT_GAME_TITLE = 'Add Game';
	$EDIT_PLAYER_GAME_STATS_TITLE = 'Add Player Game Stats';
	$EDIT_TEAM_GAME_STATS_TITLE = 'Add Team Game Stats';
	$LOGOUT_TITLE = 'Logout';
	
	// page header constants
	$HOME_HEADER = 'Home';
	$STATISTICS_HEADER = 'Statistics Leaders';
	$STANDINGS_HEADER = 'Standings';
	$PLAYERS_HEADER = 'Players';
	$PLAYER_HEADER = 'Player';
	$TEAMS_HEADER = 'Teams';
	$TEAM_HEADER = 'Team';
	$ADD_CONTRACT_HEADER = 'Add Player Contract';
	$EDIT_CONTRACT_HEADER = 'Edit Player Contract';
	$ADD_PLAYER_HEADER = 'Add Player';
	$EDIT_PLAYER_HEADER = 'Edit Player';
	$ADD_GAME_HEADER = 'Add Game';
	$EDIT_GAME_HEADER = 'Edit Game';
	$ADD_PLAYER_GAME_STATS_HEADER = 'Add Player Game Stats';
	$EDIT_PLAYER_GAME_STATS_HEADER = 'Edit Player Game Stats';
	$ADD_TEAM_GAME_STATS_HEADER = 'Add Team Game Stats';
	$EDIT_TEAM_GAME_STATS_HEADER = 'Edit Team Game Stats';
	
	// nav bar element associative array
	$NAV_BAR_ITEMS = array($HOME_URL => $HOME_TITLE, $STATISTICS_URL => $STATISTICS_TITLE, $PLAYERS_URL => $PLAYERS_TITLE, $TEAMS_URL => $TEAMS_TITLE);
	
	// admin nav bar element associative array
	$ADMIN_NAV_BAR_ITEMS = array($EDIT_PLAYER_URL => $EDIT_PLAYER_TITLE, $EDIT_CONTRACT_URL => $EDIT_CONTRACT_TITLE, $EDIT_GAME_URL => $EDIT_GAME_TITLE, $EDIT_PLAYER_GAME_STATS_URL => $EDIT_PLAYER_GAME_STATS_TITLE, $EDIT_TEAM_GAME_STATS_URL => $EDIT_TEAM_GAME_STATS_TITLE);

	// define granularity constants
	$INDIVIDUAL = 'Individual';
	$TEAM = $TEAM_TITLE;
	
	// define stat_type constants
	$PASSING = 'Passing';
	$RUSHING = 'Rushing';
	$RECEIVING = 'Receiving';
	$KICKING = 'Kicking';
	$DEFENSE = 'Defense';
	
?>