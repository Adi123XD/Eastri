const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database/db.js');

const Address = sequelize.define('Address', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  fullAddress: {
    type: DataTypes.STRING(255),
    allowNull: false,
    comment: "Full formatted address from Google Maps or user input",
  },
  street: {
    type: DataTypes.STRING(150),
    allowNull: true,
  },
  city: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  state: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  country: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  postalCode: {
    type: DataTypes.STRING(20),
    allowNull: false,
  },
  latitude: {
    type: DataTypes.DECIMAL(10, 8),
    allowNull: false,
    comment: "Latitude from Google Maps or GPS",
  },
  longitude: {
    type: DataTypes.DECIMAL(11, 8),
    allowNull: false,
    comment: "Longitude from Google Maps or GPS",
  },
  placeId: {
    type: DataTypes.STRING(100),
    allowNull: true,
    comment: "Google Maps Place ID for precise location",
  },
}, {
  tableName: 'addresses',
  timestamps: true,
});

module.exports = Address;
