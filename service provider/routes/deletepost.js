const express = require("express");
const router = express.Router();
const connection = require("../connection/connection");
const fs = require("fs");
router.get("/posts/delete/:id", authMiddleware(), (req, res, next) => {
    let $id = req.params.id;
    let $requestId = req.session.passport.user.user_id;
    console.log("REQUEST");
    console.log($requestId);
    let $sqlAuthor = "SELECT provider FROM car_rental.cars WHERE id= ?";
    let $queryAuthor = connection.query($sqlAuthor, [$id], (err, result) => {
        if (err) {
            console.log("-------ERROR: " + err);
        }
        console.log("RESULT");
        console.log(result[0].provider);
        if (result[0].provider == $requestId) {
            let $sql = "SELECT image FROM car_rental.cars WHERE id= ?";
            let $query = connection.query($sql, [$id], (err, result) => {
                if (err) {
                    console.log("-------ERROR: " + err);
                }
                let $filePath = "./uploads/" + result[0].image;
                fs.unlinkSync($filePath, (err) => {
                    if (err) {
                        console.log("couldnt delete " + result[0].image + " image");
                    }
                    res.send("image should be deleted");
                });
            });
            let $deleteSql = "DELETE FROM car_rental.cars WHERE id= ?";
            let $deleteQuery = connection.query($deleteSql, [$id], (err, result) => {
                if (err) {
                    console.log("-------ERROR: " + err);
                }
                res.redirect("/index");
            });
        }
        else {
            res.redirect("/index");
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
        z
    }
}
module.exports = router;