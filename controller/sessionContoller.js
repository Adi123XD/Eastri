const checkSession = (req, res,next) => {
    if (req.session?.user) {
       next()
    } else {
        res.status(401).json({ message: "No session found" });
    }
};

module.exports = checkSession;
