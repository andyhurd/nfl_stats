DROP TABLE IF EXISTS `NFL_YEAR_STAT` ;
DROP TABLE IF EXISTS `NFL_PLAYER_POSITION` ;
DROP TABLE IF EXISTS `NFL_PLAYER_GAME_STAT` ;
DROP TABLE IF EXISTS `NFL_TEAM_GAME_STAT` ;
DROP TABLE IF EXISTS `NFL_CATEGORY_STAT` ;
DROP TABLE IF EXISTS `NFL_POSITION_CATEGORY` ;
DROP TABLE IF EXISTS `NFL_POSITION_STAT` ;
DROP TABLE IF EXISTS `NFL_CATEGORY` ;
DROP TABLE IF EXISTS `NFL_USER` ;
DROP TABLE IF EXISTS `NFL_GAME` ;
DROP TABLE IF EXISTS `NFL_CONTRACT` ;
DROP TABLE IF EXISTS `NFL_PERSON` ;
DROP TABLE IF EXISTS `NFL_TEAM` ;
DROP TABLE IF EXISTS `NFL_DIVISION` ;
DROP TABLE IF EXISTS `NFL_CONFERENCE` ;
DROP TABLE IF EXISTS `NFL_POSITION` ;
DROP TABLE IF EXISTS `NFL_STAT` ;
DROP TABLE IF EXISTS `NFL_STADIUM` ;

-- -----------------------------------------------------
-- Table `NFL_CONFERENCE`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_CONFERENCE` (
  `CONFERENCE_ID` INT NOT NULL AUTO_INCREMENT ,
  `CONFERENCE_ABBR` VARCHAR(10) NOT NULL ,
  `CONFERENCE_NAME` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`CONFERENCE_ID`) );


-- -----------------------------------------------------
-- Table `NFL_POSITION`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_POSITION` (
  `POSITION_ID` INT NOT NULL AUTO_INCREMENT ,
  `POSITION_ABBR` VARCHAR(10) NOT NULL ,
  `POSITION_NAME` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`POSITION_ID`) );


-- -----------------------------------------------------
-- Table `NFL_STADIUM`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_STADIUM` (
  `STADIUM_ID` INT NOT NULL AUTO_INCREMENT ,
  `STADIUM_NAME` VARCHAR(50) NOT NULL ,
  `STADIUM_CITY` VARCHAR(30) NOT NULL ,
  `STADIUM_STATE` VARCHAR(30) NULL ,
  `STADIUM_COUNTRY` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`STADIUM_ID`) );


-- -----------------------------------------------------
-- Table `NFL_DIVISION`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_DIVISION` (
  `DIVISION_ID` INT NOT NULL AUTO_INCREMENT ,
  `DIVISION_NAME` VARCHAR(20) NOT NULL ,
  `CONFERENCE_ID` INT NOT NULL ,
  PRIMARY KEY (`DIVISION_ID`) ,
  INDEX `fk_nfl_division_nfl_conference` (`CONFERENCE_ID` ASC) ,
  CONSTRAINT `fk_nfl_division_nfl_conference`
    FOREIGN KEY (`CONFERENCE_ID` )
    REFERENCES `NFL_CONFERENCE` (`CONFERENCE_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_TEAM`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_TEAM` (
  `TEAM_ID` INT NOT NULL AUTO_INCREMENT ,
  `TEAM_START_DATE` DATE NOT NULL ,
  `TEAM_END_DATE` DATE NULL ,
  `TEAM_NAME` VARCHAR(45) NOT NULL ,
  `TEAM_LOCATION` VARCHAR(45) NOT NULL,
  `STADIUM_ID` INT NOT NULL ,
  `DIVISION_ID` INT NOT NULL ,
  INDEX `fk_NFL_TEAM_STADIUM_nfl_stadium1` (`STADIUM_ID` ASC) ,
  PRIMARY KEY (`TEAM_ID`) ,
  INDEX `fk_NFL_TEAM_STADIUM_nfl_division1` (`DIVISION_ID` ASC) ,
  CONSTRAINT `fk_NFL_TEAM_STADIUM_nfl_stadium1`
    FOREIGN KEY (`STADIUM_ID` )
    REFERENCES `NFL_STADIUM` (`STADIUM_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NFL_TEAM_STADIUM_nfl_division1`
    FOREIGN KEY (`DIVISION_ID` )
    REFERENCES `NFL_DIVISION` (`DIVISION_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_PERSON`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_PERSON` (
  `PERSON_ID` INT NOT NULL AUTO_INCREMENT ,
  `PERSON_HEIGHT` INT NULL ,
  `PERSON_WEIGHT` INT NULL ,
  `PERSON_FIRST_NAME` VARCHAR(30) NOT NULL ,
  `PERSON_LAST_NAME` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`PERSON_ID`) );


-- -----------------------------------------------------
-- Table `NFL_CONTRACT`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_CONTRACT` (
  `CONTRACT_ID` INT NOT NULL AUTO_INCREMENT ,
  `CONTRACT_SALARY` DECIMAL(11,2) NOT NULL ,
  `CONTRACT_YEAR` VARCHAR(45) NOT NULL ,
  `TEAM_ID` INT NOT NULL ,
  `PERSON_ID` INT NOT NULL ,
  `PERSON_NUMBER` INT NULL ,
  PRIMARY KEY (`CONTRACT_ID`) ,
  INDEX `fk_NFL_CONTRACT_NFL_TEAM1` (`TEAM_ID` ASC) ,
  INDEX `fk_NFL_CONTRACT_NFL_PERSON1` (`PERSON_ID` ASC) ,
  CONSTRAINT `fk_NFL_CONTRACT_NFL_TEAM1`
    FOREIGN KEY (`TEAM_ID` )
    REFERENCES `NFL_TEAM` (`TEAM_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NFL_CONTRACT_NFL_PERSON1`
    FOREIGN KEY (`PERSON_ID` )
    REFERENCES `NFL_PERSON` (`PERSON_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `NFL_PLAYER_POSITION`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_PLAYER_POSITION` (
  `PLAYER_POSITION_ID` INT NOT NULL AUTO_INCREMENT ,
  `POSITION_ID` INT NOT NULL ,
  `CONTRACT_ID` INT NOT NULL ,
  PRIMARY KEY (`PLAYER_POSITION_ID`) ,
  INDEX `fk_nfl_player_position_nfl_position1` (`POSITION_ID` ASC) ,
  INDEX `fk_nfl_player_position_NFL_CONTRACT1` (`CONTRACT_ID` ASC) ,
  CONSTRAINT `fk_nfl_player_position_nfl_position1`
    FOREIGN KEY (`POSITION_ID` )
    REFERENCES `NFL_POSITION` (`POSITION_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_player_position_NFL_CONTRACT1`
    FOREIGN KEY (`CONTRACT_ID` )
    REFERENCES `NFL_CONTRACT` (`CONTRACT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_GAME`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_GAME` (
  `GAME_ID` INT NOT NULL AUTO_INCREMENT ,
  `GAME_TIME` DATETIME NOT NULL ,
  `STADIUM_ID` INT NOT NULL ,
  `TEAM_ID_HOME` INT NOT NULL ,
  `TEAM_ID_VISITING` INT NOT NULL ,
  PRIMARY KEY (`GAME_ID`) ,
  INDEX `fk_nfl_game_nfl_stadium1` (`STADIUM_ID` ASC) ,
  INDEX `fk_nfl_game_NFL_TEAM1` (`TEAM_ID_HOME` ASC) ,
  INDEX `fk_nfl_game_NFL_TEAM2` (`TEAM_ID_VISITING` ASC) ,
  CONSTRAINT `fk_nfl_game_nfl_stadium1`
    FOREIGN KEY (`STADIUM_ID` )
    REFERENCES `NFL_STADIUM` (`STADIUM_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_game_NFL_TEAM1`
    FOREIGN KEY (`TEAM_ID_HOME` )
    REFERENCES `NFL_TEAM` (`TEAM_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_game_NFL_TEAM2`
    FOREIGN KEY (`TEAM_ID_VISITING` )
    REFERENCES `NFL_TEAM` (`TEAM_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_STAT`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_STAT` (
  `STAT_ID` INT NOT NULL AUTO_INCREMENT,
  `STAT_ABBR` VARCHAR(10) NOT NULL ,
  `STAT_DESC` VARCHAR(45) NULL ,
  PRIMARY KEY (`STAT_ID`) );
    
    
-- -----------------------------------------------------
-- Table `NFL_CATEGORY`
-- -----------------------------------------------------
    
CREATE TABLE IF NOT EXISTS `NFL_CATEGORY` (
`CATEGORY_ID` INT NOT NULL AUTO_INCREMENT,
`CATEGORY_DESC` VARCHAR(20) NOT NULL,
PRIMARY KEY (`CATEGORY_ID`));

-- -----------------------------------------------------
-- Table `NFL_CATEGORY_STAT`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_CATEGORY_STAT` (
  `CATEGORY_STAT_ID` INT NOT NULL AUTO_INCREMENT ,
  `CATEGORY_ID` INT NOT NULL,
  `STAT_ID` INT NOT NULL,
  PRIMARY KEY (`CATEGORY_STAT_ID`) ,
  INDEX `fk_nfl_cat_stat_cat_id` (`CATEGORY_ID` ASC) ,
  INDEX `fk_nfl_cat_stat_stat_id` (`STAT_ID` ASC) ,
  CONSTRAINT `fk_nfl_cat_stat_cat_id`
    FOREIGN KEY (`CATEGORY_ID` )
    REFERENCES `NFL_CATEGORY` (`CATEGORY_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_cat_stat_stat_id`
    FOREIGN KEY (`STAT_ID` )
    REFERENCES `NFL_STAT` (`STAT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_PLAYER_GAME_STAT`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_PLAYER_GAME_STAT` (
  `GAME_ID` INT NOT NULL ,
  `CONTRACT_ID` INT NOT NULL ,
  `CATEGORY_STAT_ID` INT NOT NULL ,
  `PLAYER_GAME_STAT_VALUE` DOUBLE NOT NULL ,
  PRIMARY KEY (`GAME_ID`, `CONTRACT_ID`, `CATEGORY_STAT_ID`) ,
  INDEX `fk_nfl_player_game_stat_nfl_stat1` (`CATEGORY_STAT_ID` ASC) ,
  INDEX `fk_nfl_player_game_stat_nfl_game1` (`GAME_ID` ASC) ,
  INDEX `fk_nfl_player_game_stat_NFL_CONTRACT1` (`CONTRACT_ID` ASC) ,
  CONSTRAINT `fk_nfl_player_game_stat_nfl_stat1`
    FOREIGN KEY (`CATEGORY_STAT_ID` )
    REFERENCES `NFL_CATEGORY_STAT` (`CATEGORY_STAT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_player_game_stat_nfl_game1`
    FOREIGN KEY (`GAME_ID` )
    REFERENCES `NFL_GAME` (`GAME_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_player_game_stat_NFL_CONTRACT1`
    FOREIGN KEY (`CONTRACT_ID` )
    REFERENCES `NFL_CONTRACT` (`CONTRACT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_TEAM_GAME_STAT`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_TEAM_GAME_STAT` (
  `GAME_ID` INT NOT NULL ,
  `TEAM_ID` INT NOT NULL ,
  `CATEGORY_STAT_ID` INT NOT NULL ,
  `TEAM_GAME_STAT_VALUE` DOUBLE NOT NULL ,
  PRIMARY KEY (`GAME_ID`, `TEAM_ID`, `CATEGORY_STAT_ID`) ,
  INDEX `fk_nfl_team_game_stat_nfl_game1` (`GAME_ID` ASC) ,
  INDEX `fk_nfl_team_game_stat_nfl_stat1` (`CATEGORY_STAT_ID` ASC) ,
  INDEX `fk_nfl_team_game_stat_NFL_TEAM1` (`TEAM_ID` ASC) ,
  CONSTRAINT `fk_nfl_team_game_stat_nfl_game1`
    FOREIGN KEY (`GAME_ID` )
    REFERENCES `NFL_GAME` (`GAME_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_team_game_stat_nfl_stat1`
    FOREIGN KEY (`CATEGORY_STAT_ID` )
    REFERENCES `NFL_CATEGORY_STAT` (`CATEGORY_STAT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfl_team_game_stat_NFL_TEAM1`
    FOREIGN KEY (`TEAM_ID` )
    REFERENCES `NFL_TEAM` (`TEAM_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- -----------------------------------------------------
-- Table `NFL_POSITION_CATEGORY`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `NFL_POSITION_CATEGORY` (
    `POSITION_ID` INT NOT NULL,
    `CATEGORY_ID` INT NOT NULL,
    PRIMARY KEY (`POSITION_ID`, `CATEGORY_ID`),
    INDEX `fk_nfl_position_id_pos_cat` (`POSITION_ID` ASC),
    INDEX `fk_nfl_category_id_pos_cat` (`CATEGORY_ID` ASC),
    CONSTRAINT `fk_nfl_position_id_pos_cat`
        FOREIGN KEY (`POSITION_ID`)
        REFERENCES `NFL_POSITION` (`POSITION_ID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_nfl_category_id_pos_cat`
        FOREIGN KEY (`CATEGORY_ID`)
        REFERENCES `NFL_CATEGORY` (`CATEGORY_ID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `NFL_USER`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_USER` (
  `USER_ID` INT NOT NULL AUTO_INCREMENT,
  `USER_NAME` VARCHAR(45) NULL ,
  `USER_PASSWORD` VARCHAR(45) NULL ,
  PRIMARY KEY (`USER_ID`) );

-- -----------------------------------------------------
-- Table `NFL_YEAR_STAT`
-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `NFL_YEAR_STAT` (
  `CONTRACT_ID` INT NOT NULL ,
  `CATEGORY_STAT_ID` INT NOT NULL ,
  `YEAR_STAT_VALUE` INT NOT NULL ,
  INDEX `fk_NFL_YEAR_STAT_NFL_CONTRACT1` (`CONTRACT_ID` ASC) ,
  INDEX `fk_NFL_YEAR_STAT_NFL_STAT1` (`CATEGORY_STAT_ID` ASC) ,
  PRIMARY KEY (`CONTRACT_ID`, `CATEGORY_STAT_ID`) ,
  CONSTRAINT `fk_NFL_YEAR_STAT_NFL_CONTRACT1`
    FOREIGN KEY (`CONTRACT_ID` )
    REFERENCES `NFL_CONTRACT` (`CONTRACT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NFL_YEAR_STAT_NFL_STAT1`
    FOREIGN KEY (`CATEGORY_STAT_ID` )
    REFERENCES `NFL_CATEGORY_STAT` (`CATEGORY_STAT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);