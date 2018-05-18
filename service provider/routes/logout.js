const express = require("express");
const router = express.Router();
const passport = require("passport");
router.get("/users/logout", (req, res, next) => {
    req.logout();
    res.redirect("/index");
});
module.exports = router;