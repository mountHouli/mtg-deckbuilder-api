FROM node:19.6.0-alpine3.16 as builder

WORKDIR /mtg-api-repo/
COPY . /mtg-api-repo/

RUN npm install

FROM node:19.6.0-alpine3.16

WORKDIR /mtg-api-repo/

COPY --from=builder /mtg-api-repo/ /mtg-api-repo/

RUN apk update
RUN apk upgrade
# Only mariadb-client (and its peer dependency mariadb-common) is needed (and not the mariadb
# server), because the DB runs in a different container.
RUN apk add mariadb-common mariadb-client

CMD ["node", "src/app.js"]
