const yup = require('yup');


exports.validateIndianPhoneNumber = async (phoneNumber) => {
    // Define the schema
    const schema = yup.object().shape({
      phoneNumber: yup
        .string()
        .matches(/^(?:\+91|91|0)?[6-9]\d{9}$/, 'Invalid  phone number')
        .required('Phone number is required'),
    });
  
    // Validate the input
    try {
      await schema.validate({ phoneNumber });
      return { success: true, message: 'Validation successful!' };
    } catch (err) {
      return { success: false, message: err.errors[0] };
    }
  };


  exports.otpnumber_validate = async (otpnumber) => {
    // Define the schema
    const schema = yup.object().shape({
      otpnumber: yup
        .string()
        .matches(/^\d{6}$/, 'Invalid OTP: OTP should be a 6-digit number') // 6-digit OTP
        .required('OTP is required'),
    });
  
    // Validate the input
    try {
      await schema.validate({ otpnumber });
      return { success: true, message: 'Validation successful!' };
    } catch (err) {
      return { success: false, message: err.errors[0] };
    }
  };