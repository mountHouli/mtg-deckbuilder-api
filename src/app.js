require('dotenv').config()

const config = require('./config')

const express = require('express')
const bodyParser = require('body-parser')

const app = express()

const { server } = config

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
