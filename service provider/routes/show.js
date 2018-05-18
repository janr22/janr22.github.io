const express = require("express");
const router = express.Router();
const connection = require("../connection/connection");
router.get("/posts/:id", (req, res) => {
    let $id = req.params.id;
    let $sql = "SELECT * FROM car_rental.cars WHERE id= ?";
    let $x;
    if (req.user != null || req.user != undefined) {
        if (req.user.user_id) {
            $x = req.user.user_id
        }
        else if (req.session.passport.user) {
            $x = req.session.passport.user;
        }
        else {
            $x = null
        }
        console.log(req.user.user_id);
        console.log(req.session.passport.user);
    }
    let $query = connection.query($sql, [$id], (err, result) => {
        if (err) {
            console.log("-------ERROR: " + err);
        }
        if (result != undefined || result != null) {
            let $userId = result[0].provider;
            let $data = result[0];
            let $sqlUser = "SELECT username FROM car_rental.service_provider WHERE id= ?";
            let $findUsername = connection.query($sqlUser, [$userId], (err, result) => {
                if (err) {
                    console.log(err)
                }
                else {
                    res.render("show", {
                        user: result[0]
                        , post: $data
                        , x: $x
                    });
                }
            });
        }
        else {
            res.send("sorry an error ocurred");
        }
    });
});
module.exports = router;