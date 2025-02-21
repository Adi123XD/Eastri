
const { Sequelize, DataTypes } = require('sequelize');
// Initialize Sequelize (replace with your database connection details)
const sequelize = require('../database/db.js')
// Define the User model
const User = sequelize.define('User', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING(100),
    allowNull: true,
  },
  email: {
    type: DataTypes.STRING(100),
    allowNull: true,
    unique: false,
  },
  phoneNumber: {
    type: DataTypes.STRING(15),
    allowNull: false,
    unique: true,
  },
}, {
  tableName: 'users', // Optional: explicitly define the table name
  timestamps: true, // Optional: adds `createdAt` and `updatedAt` fields
});

// Sync the model with the database (creates the table if it doesn't exist)
sequelize.sync()
  .then(() => {
    console.log('User table created successfully.');
  })
  .catch((error) => {
    console.error('Error creating User table:', error);
  });

module.exports = User;