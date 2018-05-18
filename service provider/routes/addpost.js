const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require("fs");
const connection = require("../connection/connection");
const upload = require("../multer/multer");
const passport = require("passport");
router.get("/addpost", authMiddleware(), (req, res, next) => {
    res.render("./addpost");
});
router.post("/addpost", authMiddleware(), (req, res, next) => {
    if (connection.error == null || connection.error == undefined) {
        upload(req, res, (error) => {
            if (req.body.title == "" || req.body.description == "") {
                res.render("./addpost", {
                    error: "All input fields must contain data"
                });
            }
            else {
                let $plate_number = req.body.plate_number;
                let $type = req.body.type;
                let $model = req.body.model;
                let $brand = req.body.brand;
                let $transition = req.body.transition;
                let $capacity = req.body.capacity;
                let $price = req.body.price;
                if (error) {
                    console.log(error);
                    res.render("./registration", {
                        err: "The image was not uploaded due an error: " + error
                    });
                }
                else {
                    let $cover = req.file.filename;
                    let $sql = "INSERT INTO car_rental.cars SET ?";
                    if (req.user.user_id) {
                        $userId = req.user.user_id
                    }
                    else {
                        $userId = req.session.passport.user
                    }
                    let $set = {
                        plate_number: $plate_number
                        , type: $type
                        , model: $model
                        , brand: $brand
                        , transition: $transition
                        , capacity: $capacity
                        , price: $price
                        , image: $cover
                        , provider: $userId
                    }
                    let $query = connection.query($sql, $set, (err, result) => {
                        if (err) {
                            console.log("---- Error:" + err);
                            let $filePath = "./uploads/" + $cover;
                            fs.unlinkSync($filePath, (err) => {
                                if (err) {
                                    console.log("couldnt delete " + $cover + " image");
                                }
                                else {
                                    console.log("Image was deleted successfully");
                                }
                            });
                        }
                        res.redirect("./index");
                    });
                }
            }
        });
    }
    else {
        res.render("./addpost", {
            err: "The database could not be reached, no changes were saved."
        });
    }
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
module.exports = router;