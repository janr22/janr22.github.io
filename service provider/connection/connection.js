const mysql = require("mysql");
const connection = mysql.createConnection({
    multipleStatements: true
    , host: 'localhost', // your host
    user: 'root', // mysql user
    password: '', // mysql password
    //database : 'car_rental' // will be created automatically
});
module.exports = connection;