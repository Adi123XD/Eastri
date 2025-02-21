const express = require('express');
const router = express.Router();
const {sendMessage,verifyOTP}  = require('../controller/otpController.js');
const {insertUser}  = require('../controller/userController.js');
const {checkSession}  = require('../controller/sessionContoller.js');
const { saveAddress } = require('../controller/addressController.js');
 

router.post('/eastri/getotp',sendMessage)
router.post('/eastri/verfiy/otp',verifyOTP,insertUser)
router.post("/eastri/savedaddress",checkSession, saveAddress)
router.post("/eastri/verfiy/session",checkSession)


module.exports = router















