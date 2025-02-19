  const {validateAddress}  = require("../service/vaildation.js")
const {Address}  = require('../model/addressModel.js')


exports.saveAddress = async (req, res) => {
    const validation = await validateAddress(req.body);

    if (!validation.valid) {
        return res.status(400).json({ message: "Validation failed", errors: validation.errors });
    }

    try {
        const address = await Address.create(req.body);
        return res.status(201).json({ message: "Address saved successfully", address });
    } catch (error) {
        console.error("Error saving address:", error);
        return res.status(500).json({ message: "Internal server error" });
    }
};