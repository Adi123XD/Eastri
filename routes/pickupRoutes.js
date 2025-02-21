const express = require('express');
const router = express.Router();
const { markAsPickedUp } = require('../controllers/pickupController');

router.put('/orders/:orderId/pickup', markAsPickedUp);


module.exports = router;
