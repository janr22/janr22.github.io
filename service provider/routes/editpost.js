const express = require("express");
const router = express.Router();
const connection = require("../connection/connection");
const fs = require("fs");
const upload = require("../multer/multer");
router.get("/posts/edit/:id", authMiddleware(), (req, res, next) => {
    let $id = req.params.id;
    let $requestId = "";
    if (req.session.passport.user.user_id == null) {
        $requestId = req.session.passport.user;
    }
    else {
        $requestId = req.session.passport.user.user_id;
    }
    console.log("DATA AFTER USER MANUALLY LOGIN");
    console.log($requestId);
    console.log("PASSPORT USER AFTER REGISTERING:");
    console.log(req.session.passport.user);
    let $sqlAuthor = "SELECT provider FROM car_rental.cars WHERE id= ?";
    let $queryAuthor = connection.query($sqlAuthor, [$id], (err, result) => {
        if (err) {
            console.log("-------ERROR: " + err);
        }
        console.log("RESULT");
        console.log(result[0].provider);
        if (result[0].provider == $requestId) {
            let $sql = "SELECT * FROM car_rental.cars WHERE id= ?";
            let $query = connection.query($sql, [$id], (err, result) => {
                if (err) {
                    console.log("-------ERROR: " + err);
                }
                res.render("editpost", {
                    post: result[0]
                });
            });
        }
        else {
            res.redirect("/index");
        }
    });
});
router.post("/posts/edit/:id", authMiddleware(), (req, res, next) => {
    upload(req, res, (error) => {
        if (error) {
            console.log(error);
            res.render("./editpost", {
                error: "an error ocurred: " + error
            });
        }
        else {
            let $id = req.params.id;
            let $plate_number = req.body.plate_number;
            let $type = req.body.type;
            let $model = req.body.model;
            let $brand = req.body.brand;
            let $transition = req.body.transition;
            let $capacity = req.body.capacity;
            let $price = req.body.price;
            let $hidden = req.body.hidden;
            let $cover = "";
            if (req.file == undefined) {
                $cover = $hidden;
            }
            else {
                $cover = req.file.filename;
                let $filePath = "./uploads/" + $hidden;
                fs.unlinkSync($filePath, (err) => {
                    if (err) {
                        console.log("couldnt delete " + $hidden + " image");
                    }
                });
            }
            let $sql = "UPDATE car_rental.cars SET plate_number = '" + $plate_number + "', type = '" + $type + "', model = '" + $model + "', brand = '" + $brand + "', transition = '" + $transition + "', capacity = '" + $capacity + "', price = '" + $price + "', image='" + $cover + "' WHERE id = ?";
            let $query = connection.query($sql, [$id], (err, result) => {
                if (err) {
                    console.log("---- Error:" + err)
                }
                res.redirect("/posts/" + $id);
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
module.exports = router;