const { db } = require('../config')

const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(db.databaseName, db.user, db.password, {
  host: db.host,
  port: db.port,
  dialect: 'mariadb',
  define: {
    timestamps: false
  }
});

async function testDbConnection() {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
    console.error('Shutting down server...')
    process.exit(1);
  }
}
testDbConnection()

module.exports = {
  sequelize
}
