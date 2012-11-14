<?php

function echoActive($test_element, $active_element) {
	if ($test_element == $active_element) {
		echo 'class="active"';
	}
}

function executeQuery($query) {
			
	// connect to MySQL
	mysql_connect("dario.cs.uwec.edu", "MEHRINLM", "M681928$")
		or die ("Could not connect to MySQL.");
				
	// select our database
	mysql_select_db("MEHRINLM")
		or die ("Could not connect to the database.");
	
	// execute the query
	$result = mysql_query($query)
		or die ("SQL Error: " . mysql_error() . "<br />");
	
	// close the database connection
	mysql_close();
	
	// return the result
	return $result;
}

function generateHeightArray() {
	foreach (range(60, 96) as $inches) {
		$heightArray[$inches] = inchesToHeightString($inches);
	}
	return $heightArray;
}

function inchesToHeightString($inches) {
	return floor(($inches)/12) . "'" . ($inches)%12 . "\"";
}

?>