const dotenv = require("dotenv").config();

module.exports = {
    dbId: process.env.DB_ID,
    dbPW: process.env.DB_PW,
    token: process.env.TOKEN
}