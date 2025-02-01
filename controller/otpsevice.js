const {
  validateIndianPhoneNumber,
  otpnumber_validate,
} = require("../service/vaildation.js");

const { sendMessageTwilio, verifyOTP } = require("../service/otpservice.js");
const { escape } = require("mysql2");

exports.sendMessage = async (req, res, next) => {
  console.log("this is my otp pls enter");
  console.log(req.body.phonenumber);
  const { phoneNumber, countryCode } = req.body;
  try {
    const data = await validateIndianPhoneNumber(phoneNumber);
    console.log(data);
    if (data.success) {
      console.log("this my data");
      console.log(sendMessageTwilio);
      const status = await sendMessageTwilio(phoneNumber, countryCode);
      res.status(200).json({ status });
    } else {
      res.status(400).json({ message: error });
    }
  } catch (error) {}
};

exports.verifyOTP = async (req, res, next) => {
  const { otp, phoneNumber, countryCode } = req.body;
  // console.log(otp);
  try {
  
    const data = await otpnumber_validate(otp);

    if (data.success) {
      console.log(verifyOTP);
      const status = await verifyOTP(phoneNumber, otp, countryCode);
  
      if (status.success === true) {
        next();
      } else {
        return res.status(400).json({ message: "OTP verification failed" });
      }
    } else {
      res.status(200).json({ message: "otp is not verfived" });
    }
  } catch (error) {
    res.status(400).json({ message: error });
  }
};
