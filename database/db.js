// Load environment variables from the .env file
require('dotenv').config();

const { Sequelize } = require('sequelize');

// Create a new Sequelize instance using environment variables
const sequelize = new Sequelize({
  dialect: 'mysql',                  // Specify MySQL dialect
  host: process.env.DB_HOST,         // Host from the .env file
  username: process.env.DB_USER,     // Username from the .env file
  password: process.env.DB_PASSWORD, // Password from the .env file
  database: process.env.DB_NAME,     // Database name from the .env file
  port: process.env.DB_PORT,         // Port from the .env file
});

(async () => {
  try {
    // Test the connection
    await sequelize.authenticate();
    console.log('Database connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
})();


module.exports =sequelize
