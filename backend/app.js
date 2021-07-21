const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const path = require("path");
const helmet = require("helmet");
const expressSanitizer = require('express-sanitizer');

const userRoutes = require("./routes/user");
const postRoutes = require("./routes/post");

// HELMET
app.use(helmet()); 

app.use((req, res, next) => { 
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
  });

app.use(bodyParser.json()); 

app.use(expressSanitizer()); 

app.use("/images", express.static(path.join(__dirname, "images")));
app.use("/api/user", userRoutes);
app.use("/api/post", postRoutes);

module.exports = app;