const twilio = require("twilio");
// Your Twilio Account SID and Auth Token (from the Twilio Console)
const accountSid =  process.env.TWILIO_ACCOUNT_SID;; // Replace with your Account SID
const authToken =  process.env.AUTH_TOKEN;; // Replace with your Auth Token

// Create a Twilio client
const client = new twilio(accountSid, authToken);

exports.sendMessageTwilio = async (phoneNumber, countryCode) => {
  console.log("this is my phone number");
  try {
    const verification = await client.verify.v2
      .services("VA9c3ddc58e1e79c8f929617b75dcd70f2")
      .verifications.create({
        to: `+${countryCode}${phoneNumber}`, // E.g., "+919876543210"
        channel: "sms", // Can also use 'whatsapp' or 'call'
      });

    console.log(`OTP sent! Verification SID: ${verification.sid}`);
    return verification.sid;
  } catch (error) {
    console.error("Error sending OTP:", error.message);
    throw error;
  }
};

exports.verifyOTP = async (phoneNumber, code, countryCode = "+91") => {
  try {
    console.log(phoneNumber, code, (countryCode = "+91"));
    // Clean and format the phone number with country code
    const cleanedPhone = phoneNumber
      .replace(/\D/g, "") // Remove all non-digit characters
      .replace(/^0+/, ""); // Remove leading zeros

    const formattedPhone = `${countryCode}${cleanedPhone}`;

    const verificationCheck = await client.verify.v2
      .services("VA9c3ddc58e1e79c8f929617b75dcd70f2") // Replace with your Service SID
      .verificationChecks.create({
        to: formattedPhone, // E.g., +919619723332
        code: code,
      });

    if (verificationCheck.status === "approved") {
      return {
        success: true,
        message: "OTP verified!",
        phone: formattedPhone, // Return formatted number for reference
      };
    } else {
      return {
        success: false,
        error: "Invalid OTP",
        phone: formattedPhone,
      };
    }
  } catch (error) {
    console.error("Twilio Error:", error);
    return {
      success: false,
      error: "OTP verification failed",
      details: error.message,
      code: error.code, // Include Twilio error code for debugging
    };
  }
};
