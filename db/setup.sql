CREATE DATABASE IF NOT EXISTS deckbuilder;

USE deckbuilder;

CREATE TABLE IF NOT EXISTS Card (
  -- I would probably never set a VARCHAR as a primary key in an enterprise application.
  -- Trying it out here, per: https://stackoverflow.com/questions/517579/strings-as-primary-keys-in-sql-database/517591#517591
  name VARCHAR(150) primary key
, scryfallData JSON not null
    COMMENT 'Card data from Scryfall.com, in JSON format'
);

CREATE TABLE IF NOT EXISTS User (
  email VARCHAR(100) primary key
);

CREATE TABLE IF NOT EXISTS UserCards (
  userCardId SMALLINT UNSIGNED auto_increment primary key
    COMMENT 'This is unsigned SMALLINT because, as of 2023, there are appx 20k Magic cards. Thus, the unsigned smallint max of 65535 is plenty big.'
, userEmail VARCHAR(100) not null
, cardName VARCHAR(150) not null
, cardCount TINYINT UNSIGNED not null
    COMMENT 'Number of copies of this card the user has in their collection.'

, CONSTRAINT fk_UserCards_userEmail
    FOREIGN KEY (userEmail) REFERENCES User (email)
      ON DELETE CASCADE
      ON UPDATE CASCADE

, CONSTRAINT fk_UserCards_cardName
      FOREIGN KEY (cardName) REFERENCES Card (name)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS Deck (
  id INT UNSIGNED auto_increment primary key
, format VARCHAR (10) not null
, userCardId SMALLINT UNSIGNED not null
, cardCount TINYINT UNSIGNED not null

, CONSTRAINT fk_Decks_userCardId
    FOREIGN KEY (userCardId) REFERENCES UserCards (userCardId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
