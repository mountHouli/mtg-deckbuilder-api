// THIS FILE HAS A PEER DEPENDENCY!
// You must call `require('dotenv').config()` (ideally as the very first line of code that your
// app runs) before require()ing this file.

const {
  SERVER_PORT,
  DB_HOST,
  DB_PORT,
  DB_USER,
  DB_PASSWORD,
  DB_DATABASE_NAME
} = process.env

module.exports = {
  server: {
    port: SERVER_PORT
  },
  db: {
    host: DB_HOST,
    port: DB_PORT,
    user: DB_USER,
    password: DB_PASSWORD,
    databaseName: DB_DATABASE_NAME,
  },
}
