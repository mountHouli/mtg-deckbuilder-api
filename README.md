# mtg-deckbuilder-api
Primary database and API of the MTG Deckbuilder app

# Local Dev

## Initial Setup

1. Create the docker (bridge-type) network that the docker containers of this service and its DB can communicate.

`docker network create mtg-deckbuilder`

## To Run the App

1. Start the DB.

This must be done before this service is started, so that this service can connect it.

`docker run --name=mtg-api-db --network mtg-deckbuilder --rm -it -p 3306:3306 -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=true mariadb:10.10.3-jammy`

Alternative to `MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=true` you can set `MARIADB_ROOT_PASSWORD=YOUR_PASSWORD` if you want to password protect the root account.

2. Start this service.

`docker run --name mtg-api --network mtg-deckbuilder --rm -it -p PORT:PORT mounthouli/mtg-deckbuilder-api:VERSION`
