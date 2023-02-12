require('dotenv').config()

const express = require('express')

const app = express()

const PORT = 8081

app.get('/', async (req, res, next) => {
  res.status(200).send('Hello World!')
})

app.listen(PORT, (err) => {
  if (err) {
    console.log('Error starting app:')
    console.log(err)
    process.exit(1)
  }

  console.log(`Server started on port ${PORT}`)
})
