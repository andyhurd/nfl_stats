-- -----------------------------------------------------
-- Insert `NFL_CONFERENCE` (Complete)
-- -----------------------------------------------------

INSERT INTO NFL_CONFERENCE (CONFERENCE_ABBR, CONFERENCE_NAME)
    VALUES ("NFC", "National Football Conference");

INSERT INTO NFL_CONFERENCE (CONFERENCE_ABBR, CONFERENCE_NAME)
    VALUES ("AFC", "American Football Conference");
    
-- -----------------------------------------------------
-- Insert `NFL_DIVISION` (Complete) 
-- -----------------------------------------------------

INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("North",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "AFC"));

    
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("North",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "NFC"));
             
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("South",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "AFC"));

    
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("South",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "NFC"));
             
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("East",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "AFC"));

    
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("East",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "NFC"));
             
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("West",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "AFC"));

    
INSERT INTO NFL_DIVISION (DIVISION_NAME, CONFERENCE_ID)
    VALUES ("West",
            (SELECT CONFERENCE_ID
             FROM NFL_CONFERENCE
             WHERE CONFERENCE_ABBR = "NFC"));
             
-- -----------------------------------------------------
-- Insert `NFL_STADIUM` (Complete)
-- -----------------------------------------------------
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("FedEx Field", "Landover", "MD", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("MetLife Stadium", "East Rutherford", "NJ", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Cowboys Stadium", "Arlington", "TX", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Arrowhead Stadium", "Kansas City", "MI", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Sports Authority Field at Mile High", "Denver", "CO", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Sun Life Stadium", "Miami Gardens", "FL", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Bank of America Stadium", "Charlotte", "NC", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Mercedes-Benz Superdome", "New Orleans", "LA", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Cleveland Browns Stadium", "Cleveland", "OH", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Lambeau Field", "Green Bay", "WI", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Ralph Wilson Stadium", "Orchard Park", "NY", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Georgia Dome", "Atlanta", "GA", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Reliant Stadium", "Houston", "TX", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("M&T Bank Stadium", "Baltimore", "MD", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Qualcomm Stadium", "San Diego", "CA", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Candlestick Park", "Seattle", "WA", "United States");
	
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Lincoln Financial Field", "Philadelphia", "PA", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("LP Field", "Nashville", "TN", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Gillette Stadium", "Foxborough", "MA", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("EverBank Field", "Jacoksonville", "FL", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Century Link Field", "Seattle", "WA", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Edward Jones Dome", "St. Louis", "MI", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Raymond James Stadium", "Tampa", "FL", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Paul Brown Stadium", "Cincinnati", "OH", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Heinz Field", "Pittsburg", "PA", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Ford Field", "Detroit", "MI", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Hubert H. Humphrey Metrodome", "Minneapolis", "MN", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("University of Phoenix Stadium", "Glendale", "AZ", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("O.co Coliseum", "Oakland", "CA", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Lucas Oil Stadium", "Indianapolis", "IN", "United States");

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Soldier Field", "Chicago", "IL", "United States");
	
	
-- -----------------------------------------------------
-- Insert `NFL_TEAM` (Complete)
-- -----------------------------------------------------
-- AFC EAST
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Buffalo', '1959-10-28', null, "Bills",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Ralph Wilson Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Miami', '1965-8-16', null, "Dolphins",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Sun Life Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Patriots	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('New England', '1959-11-22', null, "Patriots",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Gillette Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Jets
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('New York', '1959-8-14', null, "Jets",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "MetLife Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);

-- AFC NORTH
-- Ravens
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Baltimore', '1996-2-9', null, "Ravens",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "M&T Bank Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Bengals	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Cincinnati', '1967-5-23', null, "Bengals",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Paul Brown Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Browns	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Cleveland', '1944-6-4', null, "Browns",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Cleveland Browns Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Steelers
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Pittsburgh', '1933-7-8', null, "Steelers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Heinz Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
	
-- AFC SOUTH
-- Texans
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Houston', '1999-10-6', null, "Texans",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Reliant Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Colts	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Indianapolis', '1953-1-23', null, "Colts",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Lucas Oil Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Jaguars	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Jacksonville', '1993-11-23', null, "Jaguars",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "EverBank Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Titans
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Tennessee', '1959-9-14', null, "Titans",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "LP Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
	
-- AFC WEST
-- Broncos
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Denver', '1959-8-14', null, "Broncos",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Sports Authority Field at Mile High"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Cheifs	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Kansas City', '1959-8-14', null, "Chiefs",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Arrowhead Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Raiders	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Oakland', '1960-1-30', null, "Raiders",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "O.co Coliseum"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
-- Chargers
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('San Diego', '1959-8-14', null, "Chargers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Qualcomm Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC"))
			);
	
-- NFC EAST
-- Cowboys
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Dallas', '1960-1-28', null, "Cowboys",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Cowboys Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Giants	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('New York', '1925-9-1', null, "Giants",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "MetLife Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Eagles	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Philadelphia', '1933-7-8', null, "Eagles",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Lincoln Financial Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Redskins
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Washington', '1932-7-9', null, "Redskins",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "FedEx Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "East"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);

-- NFC NORTH
-- Bears
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Chicago', '1920-9-17', null, "Bears",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Soldier Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Lions	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Detroit', '1929-1-1', null, "Lions",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Ford Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Packers	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Green Bay', '1919-8-11', null, "Packers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Lambeau Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Vikings
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Minnesota', '1960-1-28', null, "Vikings",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Hubert H. Humphrey Metrodome"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
	
-- NFC SOUTH
-- Falcons
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Atlanta', '1965-6-30', null, "Falcons",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Georgia Dome"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Panthers	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Carolina', '1993-10-26', null, "Panthers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Bank of America Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Satins	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('New Orleans', '1966-11-1', null, "Saints",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Mercedes-Benz Superdome"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Buccaneers
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Tampa Bay', '1974-4-24', null, "Buccaneers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Raymond James Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "South"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
	
-- NFC WEST
-- Cardinals
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Arizona', '1898-1-1', null, "Cardinals",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "University of Phoenix Stadium"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Rams	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('St. Louis', '1936-1-1', null, "Rams",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Edward Jones Dome"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- 49ers	
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('San Francisco', '1944-6-4', null, "49ers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Candlestick Park"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
-- Seahawks
INSERT INTO NFL_TEAM (TEAM_LOCATION, TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('Seattle', '1974-6-4', null, "Seahawks",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Century Link Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "West"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "NFC"))
			);
			
-- -----------------------------------------------------
-- Insert `NFL_POSITION` (Complete)
-- -----------------------------------------------------


-- Offense
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("C", "Center");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("OG", "Offensive Guard");
	
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("G", "Guard");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("OT", "Offensive Tackle");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("TE", "Tight End");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("WR", "Wide Receiver");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("FB", "Fullback");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("RB", "Running Back");
	
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("QB", "Quarterback");

-- Defense
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("DE", "Defensive End");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("DT", "Defensive Tackle");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("LB", "Linebacker");
    
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("NT", "Nose Tackle");
    
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("CB", "Cornerback");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("S", "Safety");
    
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("FS", "Free Saftey"); 
    
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("SS", "Strong Saftey"); 
    
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("DB", "Defensive Back");

-- Special Teams
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("K", "Kicker");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("P", "Punter");
	
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("PK", "Place Kicker");
	
INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("LS", "Long Snapper");
