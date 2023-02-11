CREATE DATABASE IF NOT EXISTS deckbuilder;

USE deckbuilder;

CREATE TABLE IF NOT EXISTS Cards (
  name VARCHAR(150) primary key
, scryfallData JSON not null
    COMMENT 'Card data from Scryfall.com, in JSON format'
);

CREATE TABLE IF NOT EXISTS Users (
  email VARCHAR(100) primary key
);

CREATE TABLE IF NOT EXISTS UserCards (
  userCardId SMALLINT unsigned auto_increment primary key
    COMMENT 'This is Unsigned SMALLINT because, as of 2023, there are appx 20k Magic cards. Thus, the unsigned smallint max of 65535 is plenty big.'
, userEmail VARCHAR(100) not null
, cardName VARCHAR(150) not null
, cardCount TINYINT unsigned not null
    COMMENT 'Number of copies of this card the user has in their collection.'

, CONSTRAINT fk_UserCards_userEmail
    FOREIGN KEY (userEmail) REFERENCES Users (email)
      ON DELETE CASCADE
      ON UPDATE CASCADE

, CONSTRAINT fk_UserCards_cardName
      FOREIGN KEY (cardName) REFERENCES Cards (name)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
);
