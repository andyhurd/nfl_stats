
/*selects a players stats for a contract year, you just need to know their name and year*/

SELECT ST.STAT_DESC, YS.YEAR_STAT_VALUE
FROM NFL_STAT ST
JOIN NFL_YEAR_STAT YS
ON ST.STAT_ID = YS.STAT_ID
WHERE ST.STAT_ID IN 
    (SELECT CS.STAT_ID
    FROM NFL_CATEGORY_STAT CS
    WHERE CS.CATEGORY_ID IN 
                /*right here, if you just wanted to have the user pick the type of stats
                you could just change to WHERE CS.CATEGORY_DESC = "Rushing"  or whatever category you want*/
                            (SELECT PC.CATEGORY_ID
                            FROM NFL_POSITION_CATEGORY PC
                            WHERE POSITION_ID IN (SELECT POSITION_ID PPO
                                                FROM NFL_PLAYER_POSITION PPO
                                                WHERE PPO.CONTRACT_ID = (SELECT CT.CONTRACT_ID 
                                                                        FROM NFL_CONTRACT CT
                                                                        JOIN NFL_PERSON PS
                                                                        ON PS.PERSON_ID = CT.PERSON_ID
                                                                        WHERE (PS.PERSON_FIRST_NAME = "Jesus" AND PS.PERSON_LAST_NAME 
                                                                        = "Christ") AND CT.CONTRACT_YEAR = 1975))))
AND YS.CONTRACT_ID = (SELECT CT.CONTRACT_ID 
                    FROM NFL_CONTRACT CT
                    JOIN NFL_PERSON PS
                    ON PS.PERSON_ID = CT.PERSON_ID
                    WHERE (PS.PERSON_FIRST_NAME = "Jesus" AND PS.PERSON_LAST_NAME = "Christ") AND CT.CONTRACT_YEAR = 1975);
                    
                    
/*Select the team game stats, you'll need information about the game,
the two teams and the date of the game
for now it just selects the score, but the commented out section will let you
select any type of stats assuming they've been entered

you must use exactly what is put down here to select the scores though
seeing as they cannot be related to any sort of position, and as so
you cannot shove score into an NFL_CATEGORY as it must be related to a position */

SELECT TM.TEAM_NAME, ST.STAT_DESC, TGS.TEAM_GAME_STAT_VALUE
FROM NFL_TEAM TM
JOIN NFL_TEAM_GAME_STAT TGS
ON TM.TEAM_ID = TGS.TEAM_ID
JOIN NFL_STAT ST
ON ST.STAT_ID = TGS.STAT_ID
WHERE TGS.GAME_ID = (SELECT GAME_ID
                FROM NFL_GAME
                WHERE ((TEAM_ID_HOME = (SELECT TEAM_ID
                                        FROM NFL_TEAM
                                        WHERE TEAM_NAME = "Tigers") 
                    AND TEAM_ID_VISITING = (SELECT TEAM_ID
                                            FROM NFL_TEAM
                                            WHERE TEAM_NAME = "Bears")) AND GAME_TIME = '2012-01-01'))
/*Commenting out this next "AND" section will get you
the stats/scores for both teams in the game*/
/*
AND TGS.TEAM_ID = (SELECT TEAM_ID
            FROM NFL_TEAM
            WHERE TEAM_NAME = "Tigers")*/
AND ST.STAT_DESC = "Score"

/*AND ST.STAT_ID IN (SELECT CS.STAT_ID
    FROM NFL_CATEGORY_STAT CS
    WHERE CS.CATEGORY_ID = "Rushing")*/;



