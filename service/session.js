const checkSession = (req, res) => {
    if (req.session?.user) {
        res.json({ message: "Session exists", user: req.session.user });
    } else {
        res.status(401).json({ message: "No session found" });
    }
};

module.exports = checkSession;
