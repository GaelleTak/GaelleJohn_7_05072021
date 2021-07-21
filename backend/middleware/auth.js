
const env = require("../environment"); 
const jwt = require("jsonwebtoken"); 


module.exports = (req, res, next) => { 
    try { 
        const token = req.headers.authorization.split(" ")[1];
        const decodedToken = jwt.verify(token, env.token);
        res.locals.userID = decodedToken.userID;
        next();
    } catch{
        res.status(401).json({message: 'Requête invalide!'});
    }
};
