/*---------------------- INSERT CATEGORIES ----------------------*/

INSERT INTO NFL_CATEGORY (category_desc)
	VALUES ('Passing');

INSERT INTO NFL_CATEGORY (category_desc)
	VALUES ('Rushing');

INSERT INTO NFL_CATEGORY (category_desc)
	VALUES ('Receiving');

INSERT INTO NFL_CATEGORY (category_desc)
	VALUES ('Kicking');

INSERT INTO NFL_CATEGORY (category_desc)
	VALUES ('Defense');
	
/*---------------------- INSERT STATS ----------------------*/

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('COMP', 'Completions');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('ATT', 'Attempts');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('YDS', 'Yards');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('TD', 'Touchdowns');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('INT', 'Interceptions');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('SACK', 'Sacks');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('FUM', 'Fumbles');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('REC', 'Receptions');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('FGM', 'Field Goals Made');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('FGA', 'Field Goals Attempted');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('XPM', 'Extra Points Made');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('XPA', 'Extra Points Attempted');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('TACK', 'Tackles');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('FUMFRC', 'Fumbles Forced');

INSERT INTO NFL_STAT (stat_abbr, stat_desc)
	VALUES ('FUMREC', 'Fumbles Recovered');
	
/*---------------------- INSERT STATS IN A PARTICULAR CATGORY ----------------------*/

/* PASSING */

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Passing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'COMP'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Passing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'ATT'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Passing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'YDS'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Passing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'TD'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Passing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'INT'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Passing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'SACK'));

/* RUSHING */

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Rushing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'ATT'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Rushing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'YDS'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Rushing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'TD'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Rushing'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'FUM'));

/* RECEIVING */

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Receiving'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'REC'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Receiving'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'YDS'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Receiving'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'TD'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Receiving'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'FUM'));

/* KICKING */

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Kicking'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'FGM'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Kicking'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'FGA'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Kicking'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'XPM'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Kicking'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'XPA'));

/* KICKING */

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Defense'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'TACK'));

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Defense'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'SACK'));
			 

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Defense'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'INT'));
			 

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Defense'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'TD'));
			 

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Defense'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'FUMFRC'));
			 

INSERT INTO NFL_CATEGORY_STAT (category_id, stat_id)
	VALUES ((SELECT category_id
			 FROM NFL_CATEGORY
			 WHERE category_desc = 'Defense'),
			(SELECT stat_id
			 FROM NFL_STAT
			 WHERE stat_abbr = 'FUMREC'));
			 