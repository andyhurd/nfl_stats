/* General */
INSERT INTO NFL_CATEGORY (category_desc)
	VALUES ('General');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('GP', 'Games Played');

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'General'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'GP'));
			 
/* ------------------ POSITION_CATEGORY INSERTS ------------------ */
	
/* Center */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "C"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
/* Offensive Guard */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "OG"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
/* Offensive Tackle */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "OT"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));

/* Guard */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "G"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
/* Tight End */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "TE"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "TE"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Receiving"));
			 
/* Wide Receiver */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "WR"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "WR"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Receiving"));
			 
/* Fullback */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "FB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "FB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Rushing"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "FB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Receiving"));
			 
/* Running Back */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "RB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "RB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Rushing"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "RB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Receiving"));
			 
/* Quarterback */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "QB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "QB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Passing"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "QB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Rushing"));

/* Defensive End */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "DE"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "DE"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Defensive Tackle */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "DT"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "DT"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Nose Tackle */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "NT"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "NT"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Linebacker */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "LB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "LB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Cornerback */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "CB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "CB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Safety */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "S"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "S"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Defensive Back */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "DB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "DB"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Free Safety */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "FS"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "FS"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Strong Safety */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "SS"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "SS"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Defense"));

/* Kicker */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "K"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));
			 
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "K"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Kicking"));

/* Punter */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "P"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));

/* Place Kicker */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "PK"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));

INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "PK"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "Kicking"));

/* Long Snapper */
INSERT INTO NFL_POSITION_CATEGORY (POSITION_ID, CATEGORY_ID)
	VALUES ((SELECT position_id
			FROM NFL_POSITION
			WHERE position_abbr = "LS"),
			(SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = "General"));