require('dotenv').config()

const config = require('./config')

const express = require('express')
const bodyParser = require('body-parser')

const { server, db } = config
const app = express()

// TODO! Move Sequelize to its own file.
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(db.databaseName, db.user, db.password, {
  host: db.host,
  port: db.port,
  dialect: 'mariadb',
  define: {
    timestamps: false
  }
});

async function TODO__REMOVE_THIS_TEST_CODE__tryDbConn() {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}
TODO__REMOVE_THIS_TEST_CODE__tryDbConn()

app.use(bodyParser.json())

app.get('/', async (req, res, next) => {
  res.status(200).send('Hello World!')
})

app.listen(server.port, (err) => {
  if (err) {
    console.log('Error starting app:')
    console.log(err)
    process.exit(1)
  }

  console.log(`Server started on port ${server.port}`)
})
