const express = require("express");
const router = express.Router();
const connection = require("../connection/connection");
const fs = require("fs");
const upload = require("../multer/users");
var bcrypt = require('bcrypt');
const saltRounds = 10;
let passport = require("passport");
router.get("/users/register", (req, res) => {
    res.render("./registration");
});
router.post("/users/register", (req, res, next) => {
    if (connection.error == null || connection.error == undefined) {
        upload(req, res, (error) => {
            if (req.body.email == "" || req.body.password == "") {
                res.render("./registration", {
                    err: "All input fields must contain data"
                });
            }
            else {
                if (error) {
                    console.log(error);
                    res.render("./registration", {
                        err: "The image was not uploaded due an error: " + error
                    });
                }
                else {
                    let $username = req.body.username;
                    let $email = req.body.email;
                    let $contact = req.body.contact;
                    let $website = req.body.website;
                    let $address = req.body.address;
                    let $password = req.body.password;
                    let $image = req.file.filename;
                    var $hash = bcrypt.hashSync($password, saltRounds);
                    let $sql = "INSERT INTO car_rental.service_provider SET ?";
                    let $set = {
                        username: $username
                        , email: $email
                        , contact: $contact
                        , password: $hash
                        , image: $image
                        , website: $website
                        , address: $address
                    }
                    let $query = connection.query($sql, $set, (err, result) => {
                        if (err) {
                            console.log("---- Error:" + err)
                            let $filePath = "./users/images/" + $image;
                            fs.unlinkSync($filePath, (err) => {
                                if (err) {
                                    console.log("couldnt delete " + $image + " image");
                                }
                                else {
                                    console.log("Image was deleted successfully");
                                }
                            });
                            res.render("./registration", {
                                err: "Unable to connect to the database, the user was not saved"
                            });
                        }
                        else {
                            let $login = "SELECT LAST_INSERT_ID() as user_id";
                            let $loginQuery = connection.query($login, (err, result) => {
                                if (err) {
                                    console.log("---- Error:" + err);
                                }
                                const user_id = result[0].user_id;
                                console.log(result[0].user_id);
                                req.login(user_id, () => {
                                    res.redirect("/user/profile");
                                });
                            });
                        }
                    });
                }
            }
        });
    }
    else {
        res.render("./registration", {
            err: "The database could not be reached, no changes were saved."
        });
    }
});
passport.serializeUser(function (user_id, done) {
    done(null, user_id);
});
passport.deserializeUser(function (user_id, done) {
    done(null, user_id);
});
module.exports = router;