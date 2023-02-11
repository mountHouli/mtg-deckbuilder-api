CREATE DATABASE IF NOT EXISTS deckbuilder;

USE deckbuilder;

CREATE TABLE IF NOT EXISTS Cards (
  name VARCHAR(150) primary key,
  scryfallData VARCHAR(50) not null
    COMMENT 'Card data from Scryfall.com, in JSON format'
);

CREATE TABLE IF NOT EXISTS Users (
  email VARCHAR(100) primary key
);
