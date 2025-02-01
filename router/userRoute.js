const express = require('express');
const router = express.Router();
const {sendMessage,verifyOTP}  = require('../controller/otpsevice.js')
const {insertUser}  = require('../controller/userService.js')
 

router.post('/eastri/getotp',sendMessage)
router.post('/eastri/verfiy/otp',verifyOTP,insertUser)


module.exports = router















