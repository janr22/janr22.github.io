const express = require("express");
const router = express.Router();
const connection = require("../connection/connection");
router.get("/user/profile", authMiddleware(), (req, res) => {
    let $id = req.user.user_id || req.session.passport.user;
    let $userId = "SELECT * from car_rental.service_provider WHERE id = ?";
    let $queryUserId = connection.query($userId, [$id], (err, result) => {
        if (err) {
            console.log(err);
            res.redirect("/login");
        }
        else {
            res.render("./dashboard", {
                user: result[0]
            });
        }
    });
});

function authMiddleware() {
    return (req, res, next) => {
        console.log(`req.session.passport: ${JSON.stringify(req.session.passport)}`);
        if (req.isAuthenticated()) {
            return next();
        }
        else {
            res.redirect("/users/login");
        }
    }
}
module.exports = router