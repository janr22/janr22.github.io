const express = require("express");
const app = express();
const bodyParser = require("body-parser");
var mysql = require('mysql');
var path = require("path");
const connection = require("./connection/connection");
const index = require("./routes/index");
const addPost = require("./routes/addpost");
const updatePost = require("./routes/editpost");
const show = require("./routes/show");
const deletepost = require("./routes/deletepost");
const registration = require("./routes/registration");
const login = require("./routes/login");
const user = require("./routes/user");
const logout = require("./routes/logout");
let session = require('express-session');
let passport = require("passport");
let LocalStrategy = require("passport-local").Strategy;
const bcrypt = require("bcrypt");
app.use(express.static("./public"));
app.use(express.static("./uploads"));
app.use(express.static("./users/avatars"));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");
app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(bodyParser.json());
app.use(session({
    secret: 'YHprvmaIW1'
    , resave: false
    , saveUninitialized: false
, }));
app.use(passport.initialize());
app.use(passport.session());
connection.connect((err) => {
    if (err) {
        console.log("ERROR: " + err);
    }
    let $sql = "CREATE DATABASE IF NOT EXISTS car_rental ; CREATE TABLE IF NOT EXISTS car_rental.service_provider (id INT(6) AUTO_INCREMENT PRIMARY KEY, username VARCHAR(255), email VARCHAR(255), website VARCHAR(255), address VARCHAR(255), contact VARCHAR(255), image VARCHAR(255), password VARCHAR(255)) ; CREATE TABLE IF NOT EXISTS car_rental.cars (id INT(6) AUTO_INCREMENT PRIMARY KEY, plate_number VARCHAR(255), type VARCHAR(255), model VARCHAR(255), brand VARCHAR(255),transition VARCHAR(255),capacity INT(255),price INT(255), image VARCHAR(255), provider VARCHAR(255), FOREIGN KEY (id) REFERENCES car_rental.service_provider(id))";
    let $query = connection.query($sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        else {
            console.log("DATABASE & TABLE ARE CREATED");
        }
    });
});
app.use((req, res, next) => {
    res.locals.isAuthenticated = req.isAuthenticated();
    next();
});
app.get("/", (req, res) => {
    res.render("home");
});
app.use("/", index);
app.use("/", addPost);
app.use("/", updatePost);
app.use("/", show);
app.use("/", deletepost);
app.use("/", registration);
app.use("/", login);
app.use("/", user);
app.use("/", logout);
passport.use(new LocalStrategy(function (username, password, done) {
    console.log(`
        ----------USERNAME: ${username},
        ----------PASSWORD: ${password}
        `);
    let $checkUser = "SELECT id, password from car_rental.service_provider WHERE username = ?";
    let $username = username;
    let $queryUser = connection.query($checkUser, [$username], (err, result) => {
        if (err) {
            console.log(err);
            done(err);
        }
        if (result == null || result == undefined || result.length === 0) {
            console.log("USER NOT FOUND");
            done(null, false);
        }
        else {
            let $password = password;
            let $hash = result[0].password;
            console.log(result[0].password);
            bcrypt.compare($password, $hash, (err, response) => {
                if (response === true) {
                    console.log("USER FOUND");
                    return done(null, {
                        user_id: result[0].id
                    });
                }
                else {
                    return done(null, false);
                }
            });
        }
    });
}));
app.listen(4200, () => {
    console.log("listening for traffic on por 4200");
});