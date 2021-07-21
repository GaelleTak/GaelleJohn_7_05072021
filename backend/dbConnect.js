const mysql = require('mysql');
const env = require('./environment'); 

exports.connection = mysql.createPool({
    host     : 'localhost',
    user     : `${env.dbId}`,
    password : `${env.dbPW}`,
    database : 'groupomania',
    timezone : 'local',
    charset : 'utf8mb4'
  });
