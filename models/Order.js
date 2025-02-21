const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database/db.js');
const Cloth = require('./Cloth');

const Order = sequelize.define('Order', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  status: {
    type: DataTypes.ENUM('Pending', 'PickedUp', 'Processing', 'Completed'),
    defaultValue: 'Pending',
  },
  pickupTime: {
    type: DataTypes.DATE,
    allowNull: false,
    validate: {
      isAfter: new Date().toISOString(),
    },
  },
}, {
  tableName: 'orders',
  timestamps: true,
});

Order.hasMany(Cloth, { foreignKey: 'orderId', as: 'clothes' });
module.exports = Order;