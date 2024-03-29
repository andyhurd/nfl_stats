-- -----------------------------
-- delete everyting
-- -----------------------------
DELETE FROM NFL_PLAYER_GAME_STAT
WHERE GAME_ID > 0;

DELETE FROM NFL_TEAM_GAME_STAT
WHERE GAME_ID > 0;

DELETE FROM NFL_GAME
WHERE GAME_ID > 0;

-- -----------------------------
-- ADD GAMES EXAMPLES
-- -----------------------------

INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-9', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "49ers"));
		 
INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-13', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Bears"));
		 
INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Seahawks"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Seahawks"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"));
		 
INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Saints"));

INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Colts"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Colts"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"));

INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Texans"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Texans"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"));

INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Rams"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Rams"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"));

INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Jaguars"));
		 
INSERT INTO NFL_GAME(GAME_TIME, STADIUM_ID, TEAM_ID_HOME, TEAM_ID_VISITING)
	VALUES ('2012-9-24', 
		(SELECT STADIUM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Cardinals"));
         

-- -----------------------------
-- NFL_PLAYER_GAME_STAT table example
-- -----------------------------
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "COMP"
		AND CATEGORY_DESC = "Passing"),
		30
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "ATT"
		AND CATEGORY_DESC = "Passing"),
		44
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "YDS"
		AND CATEGORY_DESC = "Passing"),
		303
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "TD"
		AND CATEGORY_DESC = "Passing"),
		2
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "INT"
		AND CATEGORY_DESC = "Passing"),
		1
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "SACK"
		AND CATEGORY_DESC = "Passing"),
		3
	);

INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "ATT"
		AND CATEGORY_DESC = "Rushing"),
		1
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "YDS"
		AND CATEGORY_DESC = "Rushing"),
		0
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		WHERE STAT_ABBR = "TD"
		AND CATEGORY_DESC = "Rushing"),
		0
	);
	
INSERT INTO NFL_PLAYER_GAME_STAT(GAME_ID, CONTRACT_ID, CATEGORY_STAT_ID, PLAYER_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT CONTRACT_ID
		 FROM NFL_CONTRACT
		 WHERE TEAM_ID = 
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND PERSON_ID = 
			(SELECT PERSON_ID
			 FROM NFL_PERSON
			 WHERE PERSON_FIRST_NAME = "aaron"
				AND PERSON_HEIGHT = 74
				AND PERSON_WEIGHT = 225
				AND PERSON_LAST_NAME = "rodgers")),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "FUM"
		 AND CATEGORY_DESC = "Rushing"),
		1
	);

-- --------------------------------
-- NFL TEAM GAME STATS EXAMPLE
-- --------------------------------
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID,CATEGORY_STAT_ID,  TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "COMP"
		 AND CATEGORY_DESC = "Passing"),
		30
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "ATT"
		 AND CATEGORY_DESC = "Passing"),
		44
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "YDS"
		 AND CATEGORY_DESC = "Passing"),
		297
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "TD"
		 AND CATEGORY_DESC = "Passing"),
		2
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "INT"
		 AND CATEGORY_DESC = "Passing"),
		1
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "SACK"
		 AND CATEGORY_DESC = "Passing"),
		3
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "ATT"
		 AND CATEGORY_DESC = "Rushing"),
		14
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "YDS"
		 AND CATEGORY_DESC = "Rushing"),
		45
	);

INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "TD"
		 AND CATEGORY_DESC = "Rushing"),
		1
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "FUM"
		 AND CATEGORY_DESC = "Rushing"),
		1
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "FGM"
		 AND CATEGORY_DESC = "Kicking"),
		0
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "FGA"
		 AND CATEGORY_DESC = "Kicking"),
		0
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "XPM"
		 AND CATEGORY_DESC = "Kicking"),
		2
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "XPA"
		 AND CATEGORY_DESC = "Kicking"),
		2
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "TACK"
		 AND CATEGORY_DESC = "Defense"),
		46
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "SACK"
		 AND CATEGORY_DESC = "Defense"),
		4
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "INT"
		 AND CATEGORY_DESC = "Defense"),
		0
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "TD"
		 AND CATEGORY_DESC = "Defense"),
		0
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "FUMFRC"
		 AND CATEGORY_DESC = "Defense"),
		1
	);
	
INSERT INTO NFL_TEAM_GAME_STAT (GAME_ID, TEAM_ID, CATEGORY_STAT_ID, TEAM_GAME_STAT_VALUE)
	VALUES (
		(SELECT GAME_ID
		 FROM NFL_GAME
		 WHERE TEAM_ID_HOME =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "Packers")
		 AND TEAM_ID_VISITING =
			(SELECT TEAM_ID
			 FROM NFL_TEAM
			 WHERE TEAM_NAME = "49ers")),
		(SELECT TEAM_ID
		 FROM NFL_TEAM
		 WHERE TEAM_NAME = "Packers"),
		(SELECT CATEGORY_STAT_ID
		 FROM NFL_CATEGORY_STAT
			INNER JOIN NFL_STAT ON NFL_CATEGORY_STAT.stat_id = NFL_STAT.stat_id
			INNER JOIN NFL_CATEGORY ON NFL_CATEGORY.category_id = NFL_CATEGORY_STAT.category_id
		 WHERE STAT_ABBR = "FUMREC"
		 AND CATEGORY_DESC = "Defense"),
		0
	);