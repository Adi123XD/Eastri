
const User = require('../models/userModel.js')
exports.insertUser = async (req, res) => {
  const { name , email = null, phoneNumber } = req.body;

  if (!phoneNumber) {
    return res.status(400).json({ message: "Phone number is required" });
  }

  try {
    // Check if the user already exists
    let [user, created] = await User.findOrCreate({
      where: { phoneNumber },
      defaults: { name, email }, // Only set these if creating a new user
    });
 

    const message = created
      ? "User inserted successfully"
      : "User already exists";
   req.session.user = user
    res.status(created ? 201 : 200).json({
      message,
      user,
    });
  } catch (error) {
    console.error("Error inserting user:", error);
    res.status(500).json({
      message: "Error inserting user",
      error: error.message,
    });
  }
};