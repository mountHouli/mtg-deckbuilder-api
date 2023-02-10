FROM node:19.6.0-alpine3.16 as builder

WORKDIR /mtg-api-repo/
COPY . /mtg-api-repo/

RUN npm install

FROM node:19.6.0-alpine3.16

WORKDIR /mtg-api-repo/

COPY --from=builder /mtg-api-repo/ /mtg-api-repo/

CMD ["node", "src/app.js"]
