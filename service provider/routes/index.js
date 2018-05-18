const express = require("express");
const router = express.Router();
const connection = require("../connection/connection");
router.get("/index", (req, res) => {
    let $sql = "SELECT * FROM car_rental.cars ORDER BY id DESC";
    let $query = connection.query($sql, (err, result) => {
        if (err) {
            console.log("-------ERROR: " + err);
        }
        let $posts = [];
        if (result != null) {
            for (let i = 0; i < result.length; i++) {
                $posts.push(result[i]);
            }
            res.render("index", {
                posts: $posts
            });
        }
        else {
            res.render("index");
        }
    });
});
module.exports = router;