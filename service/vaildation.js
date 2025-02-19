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


  exports.validateAddress = async (addressData) => {
    const schema = yup.object().shape({
        fullAddress: yup.string().max(255).required('Full address is required'),
        street: yup.string().max(150).nullable(),
        city: yup.string().max(100).required('City is required'),
        state: yup.string().max(100).required('State is required'),
        country: yup.string().max(100).required('Country is required'),
        postalCode: yup
            .string()
            .matches(/^\d{5,10}$/, 'Invalid postal code')
            .required('Postal code is required'),
        latitude: yup
            .number()
            .min(-90, 'Invalid latitude')
            .max(90, 'Invalid latitude')
            .required('Latitude is required'),
        longitude: yup
            .number()
            .min(-180, 'Invalid longitude')
            .max(180, 'Invalid longitude')
            .required('Longitude is required'),
        placeId: yup.string().max(100).nullable(),
    });

    try {
        await schema.validate(addressData);
        return { success: true, message: 'Validation successful!' };
    } catch (err) {
        return { success: false, message: err.errors[0] };
    }
};