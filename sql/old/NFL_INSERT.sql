-- -----------------------------------------------------
-- Insert `NFL_CONFERENCE` Examples
-- -----------------------------------------------------

INSERT INTO NFL_CONFERENCE (CONFERENCE_ABBR, CONFERENCE_NAME)
    VALUES ("NFC", "National Football Conference");

INSERT INTO NFL_CONFERENCE (CONFERENCE_ABBR, CONFERENCE_NAME)
    VALUES ("AFC", "American Football Conference");


-- -----------------------------------------------------
-- Insert `NFL_POSITION` Examples
-- -----------------------------------------------------

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("RB", "Running Back");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("QB", "Quarterback");

INSERT INTO NFL_POSITION (POSITION_ABBR, POSITION_NAME)
    VALUES ("DE", "Defensive End");
    

-- -----------------------------------------------------
-- Insert `NFL_STADIUM` Examples
-- -----------------------------------------------------

INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Century Link Field", "Seattle", "WA", "United States");
    
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Heinz Field", "Pittsburgh", "PA", "United States");
    
INSERT INTO NFL_STADIUM (STADIUM_NAME, STADIUM_CITY, STADIUM_STATE, STADIUM_COUNTRY)
    VALUES ("Georgia Dome", "Atlanta", "GA", "United States");


-- -----------------------------------------------------
-- Insert `NFL_DIVISION` Examples
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
-- Insert `NFL_ORGANIZATION` Examples
-- -----------------------------------------------------

INSERT INTO NFL_ORGANIZATION (ORGANIZATION_FOUNDING_DATE)
    VALUES ('1992-9-6');

INSERT INTO NFL_ORGANIZATION (ORGANIZATION_FOUNDING_DATE)
    VALUES ('1967-2-3');

    

-- -----------------------------------------------------
-- Insert `NFL_TEAM` Example
-- -----------------------------------------------------
    
INSERT INTO NFL_TEAM (TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('1967-2-3', '1975-3-4', "Bears",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Heinz Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC")));
                                     
                                     
INSERT INTO NFL_TEAM (TEAM_START_DATE, TEAM_END_DATE, TEAM_NAME, STADIUM_ID, DIVISION_ID)
    VALUES ('1967-2-3', '1975-3-4', "Tigers",
            (SELECT STADIUM_ID
             FROM NFL_STADIUM
             WHERE STADIUM_NAME = "Century Link Field"),
             
            (SELECT DIVISION_ID
             FROM NFL_DIVISION
             WHERE DIVISION_NAME = "North"
                AND CONFERENCE_ID = (SELECT CONFERENCE_ID
                                     FROM NFL_CONFERENCE
                                     WHERE CONFERENCE_ABBR = "AFC")));
             
             
                     

-- -----------------------------------------------------
-- Table `NFL_PERSON`
-- -----------------------------------------------------

INSERT INTO NFL_PERSON (PERSON_HEIGHT, PERSON_WEIGHT, PERSON_FIRST_NAME, PERSON_LAST_NAME)
    VALUES (75, 215, "Jesus", "Christ"); 
INSERT INTO NFL_PERSON (PERSON_HEIGHT, PERSON_WEIGHT, PERSON_FIRST_NAME, PERSON_LAST_NAME)
    VALUES (75, 215, "Horatio", "Smith"); 
    
    
    
-- -----------------------------------------------------
-- Table `NFL_CONTRACT`
-- -----------------------------------------------------

INSERT INTO NFL_CONTRACT (CONTRACT_SALARY, CONTRACT_YEAR, TEAM_ID, PERSON_ID)
    VALUES (2000000, 1975, (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "BEARS"),
                            (SELECT PERSON_ID
                                FROM NFL_PERSON
                                WHERE PERSON_FIRST_NAME = "Jesus" AND PERSON_LAST_NAME = "CHRIST"));

INSERT INTO NFL_CONTRACT (CONTRACT_SALARY, CONTRACT_YEAR, TEAM_ID, PERSON_ID)
    VALUES (2000000, 1975, (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "BEARS"),
                            (SELECT PERSON_ID
                                FROM NFL_PERSON
                                WHERE PERSON_FIRST_NAME = "Horatio" AND PERSON_LAST_NAME = "Smith"));
                                
INSERT INTO NFL_CONTRACT (CONTRACT_SALARY, CONTRACT_YEAR, TEAM_ID, PERSON_ID)
    VALUES (2000000, 1970, (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "BEARS"),
                            (SELECT PERSON_ID
                                FROM NFL_PERSON
                                WHERE PERSON_FIRST_NAME = "Jesus" AND PERSON_LAST_NAME = "Christ"));
                                
-- -----------------------------------------------------
-- Table `NFL_PLAYER_POSITION`
-- -----------------------------------------------------

INSERT INTO NFL_PLAYER_POSITION (POSITION_ID, CONTRACT_ID)
    VALUES((SELECT POSITION_ID 
                FROM NFL_POSITION 
                WHERE POSITION_NAME = "Running Back"), 
            (SELECT CONTRACT_ID 
                FROM NFL_CONTRACT CT
                JOIN NFL_PERSON PS
                ON CT.PERSON_ID = PS.PERSON_ID
                WHERE (PERSON_FIRST_NAME = "Jesus" AND PERSON_LAST_NAME = "Christ") AND CT.CONTRACT_YEAR = 1975));
                
    

INSERT INTO NFL_PLAYER_POSITION (POSITION_ID, CONTRACT_ID)
    VALUES((SELECT POSITION_ID 
                FROM NFL_POSITION 
                WHERE POSITION_NAME = "Quarterback"), 
            (SELECT CONTRACT_ID 
                FROM NFL_CONTRACT CT
                JOIN NFL_PERSON PS
                ON CT.PERSON_ID = PS.PERSON_ID
                WHERE (PERSON_FIRST_NAME = "Jesus" AND PERSON_LAST_NAME = "Christ") AND CT.CONTRACT_YEAR = 1975));
            
INSERT INTO NFL_PLAYER_POSITION (POSITION_ID, CONTRACT_ID)
    VALUES((SELECT POSITION_ID 
            FROM NFL_POSITION 
            WHERE POSITION_NAME = "Quarterback"), 
           (SELECT CONTRACT_ID 
                FROM NFL_CONTRACT CT
                JOIN NFL_PERSON PS
                ON CT.PERSON_ID = PS.PERSON_ID
                WHERE (PERSON_FIRST_NAME = "Horatio" AND PERSON_LAST_NAME = "Smith") AND CT.CONTRACT_YEAR = 1975));
                                  
-- -----------------------------------------------------
-- Table `NFL_STAT`
-- -----------------------------------------------------

INSERT INTO NFL_STAT (STAT_ABBR, STAT_DESC)
    VALUES ("TD", "Touchdowns");
INSERT INTO NFL_STAT (STAT_ABBR, STAT_DESC)
    VALUES ("RY", "Rushing Yards");
INSERT INTO NFL_STAT (STAT_ABBR, STAT_DESC)
    VALUES ("FB", "Fumbles");
INSERT INTO NFL_STAT (STAT_ABBR, STAT_DESC)
    VALUES ("PY", "Passing Yards");
INSERT INTO NFL_STAT (STAT_ABBR, STAT_DESC)
    VALUES ("SC", "Score");
    
-- -----------------------------------------------------
-- Table `NFL_USER`
-- -----------------------------------------------------

INSERT INTO NFL_USER (USER_NAME, USER_PASSWORD)
    VALUES ("user", "user");
    
    
-- -----------------------------------------------------
-- Table `NFL_CATEGORY`
-- -----------------------------------------------------

INSERT INTO NFL_CATEGORY (CATEGORY_DESC)
    VALUES ("Rushing");
INSERT INTO NFL_CATEGORY (CATEGORY_DESC)
    VALUES ("Passing");
INSERT INTO NFL_CATEGORY (CATEGORY_DESC)
    VALUES ("Team");
    
    
-- -----------------------------------------------------
-- Table `NFL_POSITION_CATEGORY`
-- -----------------------------------------------------
    
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
    VALUES ((SELECT POSITION_ID
            FROM NFL_POSITION
            WHERE POSITION_NAME = "Running Back"),
            (SELECT CATEGORY_ID
            FROM NFL_CATEGORY
            WHERE CATEGORY_DESC = "Rushing"));
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
    VALUES ((SELECT POSITION_ID
            FROM NFL_POSITION
            WHERE POSITION_NAME = "Quarterback"),
            (SELECT CATEGORY_ID
            FROM NFL_CATEGORY
            WHERE CATEGORY_DESC = "Passing"));
    
-- -----------------------------------------------------
-- Table `NFL_CATEGORY_STAT`
-- -----------------------------------------------------

INSERT INTO NFL_CATEGORY_STAT (CATEGORY_ID, STAT_ID)
    VALUES ((SELECT CATEGORY_ID
            FROM NFL_CATEGORY
            WHERE CATEGORY_DESC = "Rushing"), 
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Rushing Yards"));
INSERT INTO NFL_CATEGORY_STAT (CATEGORY_ID, STAT_ID)
    VALUES ((SELECT CATEGORY_ID
            FROM NFL_CATEGORY
            WHERE CATEGORY_DESC = "Rushing"), 
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Fumbles"));
INSERT INTO NFL_CATEGORY_STAT (CATEGORY_ID, STAT_ID)
    VALUES ((SELECT CATEGORY_ID
            FROM NFL_CATEGORY
            WHERE CATEGORY_DESC = "Passing"), 
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Passing Yards"));
INSERT INTO NFL_CATEGORY_STAT (CATEGORY_ID, STAT_ID)
    VALUES ((SELECT CATEGORY_ID
            FROM NFL_CATEGORY
            WHERE CATEGORY_DESC = "Passing"), 
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Touchdowns"));
-- -----------------------------------------------------
-- Table `NFL_YEAR_STAT`
-- -----------------------------------------------------

INSERT INTO NFL_YEAR_STAT (CONTRACT_ID, STAT_ID, YEAR_STAT_VALUE)
    VALUES ((SELECT CONTRACT_ID 
            FROM NFL_CONTRACT CT
            JOIN NFL_PERSON PR
            ON CT.PERSON_ID = PR.PERSON_ID
            WHERE (PR.PERSON_FIRST_NAME = "Jesus" AND PR.PERSON_LAST_NAME = "Christ") AND CT.CONTRACT_YEAR = 1975),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Fumbles"),
            4);
INSERT INTO NFL_YEAR_STAT (CONTRACT_ID, STAT_ID, YEAR_STAT_VALUE)
    VALUES ((SELECT CONTRACT_ID 
            FROM NFL_CONTRACT CT
            JOIN NFL_PERSON PR
            ON CT.PERSON_ID = PR.PERSON_ID
            WHERE (PR.PERSON_FIRST_NAME = "Jesus" AND PR.PERSON_LAST_NAME = "Christ") AND CT.CONTRACT_YEAR = 1975),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Rushing Yards"),
            4);
INSERT INTO NFL_YEAR_STAT (CONTRACT_ID, STAT_ID, YEAR_STAT_VALUE)
    VALUES ((SELECT CONTRACT_ID 
            FROM NFL_CONTRACT CT
            JOIN NFL_PERSON PR
            ON CT.PERSON_ID = PR.PERSON_ID
            WHERE (PR.PERSON_FIRST_NAME = "Jesus" AND PR.PERSON_LAST_NAME = "Christ") AND CT.CONTRACT_YEAR = 1975),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Touchdowns"),
            4);
            
INSERT INTO NFL_YEAR_STAT (CONTRACT_ID, STAT_ID, YEAR_STAT_VALUE)
    VALUES ((SELECT CONTRACT_ID 
            FROM NFL_CONTRACT CT
            JOIN NFL_PERSON PR
            ON CT.PERSON_ID = PR.PERSON_ID
            WHERE (PR.PERSON_FIRST_NAME = "Horatio" AND PR.PERSON_LAST_NAME = "Smith") AND CT.CONTRACT_YEAR = 1975),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Fumbles"),
            4);
INSERT INTO NFL_YEAR_STAT (CONTRACT_ID, STAT_ID, YEAR_STAT_VALUE)
    VALUES ((SELECT CONTRACT_ID 
            FROM NFL_CONTRACT CT
            JOIN NFL_PERSON PR
            ON CT.PERSON_ID = PR.PERSON_ID
            WHERE (PR.PERSON_FIRST_NAME = "Horatio" AND PR.PERSON_LAST_NAME = "Smith") AND CT.CONTRACT_YEAR = 1975),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Rushing Yards"),
            4);
INSERT INTO NFL_YEAR_STAT (CONTRACT_ID, STAT_ID, YEAR_STAT_VALUE)
    VALUES ((SELECT CONTRACT_ID 
            FROM NFL_CONTRACT CT
            JOIN NFL_PERSON PR
            ON CT.PERSON_ID = PR.PERSON_ID
            WHERE (PR.PERSON_FIRST_NAME = "Horatio" AND PR.PERSON_LAST_NAME = "Smith") AND CT.CONTRACT_YEAR = 1975),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Touchdowns"),
            4);
            


-- -----------------------------------------------------
-- Table `NFL_GAME`
-- -----------------------------------------------------

INSERT INTO NFL_GAME (GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
    VALUES('2012-01-01', 
        (SELECT STADIUM_ID
        FROM NFL_STADIUM
        WHERE STADIUM_NAME = "Century Link Field"),
        (SELECT TEAM_ID
        FROM NFL_TEAM
        WHERE TEAM_NAME = "Tigers"),
        (SELECT TEAM_ID
        FROM NFL_TEAM
        WHERE TEAM_NAME = "Bears"));


-- -----------------------------------------------------
-- Table `NFL_TEAM_GAME_STAT`
-- -----------------------------------------------------

INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, STAT_ID, TEAM_GAME_STAT_VALUE)
    VALUES((SELECT GAME_ID
            FROM NFL_GAME
            WHERE ((TEAM_ID_HOME = (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "Tigers") 
                    AND TEAM_ID_VISITING = (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "Bears")) AND GAME_TIME = '2012-01-01')),
            (SELECT TEAM_ID
            FROM NFL_TEAM
            WHERE TEAM_NAME = "Tigers"),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Score"),
            26);
            
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, STAT_ID, TEAM_GAME_STAT_VALUE)
    VALUES((SELECT GAME_ID
            FROM NFL_GAME
            WHERE ((TEAM_ID_HOME = (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "Tigers") 
                    AND TEAM_ID_VISITING = (SELECT TEAM_ID
                                FROM NFL_TEAM
                                WHERE TEAM_NAME = "Bears")) AND GAME_TIME = '2012-01-01')),
            (SELECT TEAM_ID
            FROM NFL_TEAM
            WHERE TEAM_NAME = "Bears"),
            (SELECT STAT_ID
            FROM NFL_STAT
            WHERE STAT_DESC = "Score"),
            32);
    
    
    
    
    
    
    
    
    
    
    
    
    