/*FICHIER EXTERNALISE DE CONFIGURATION POUR PERMETTRE LA CONNECTION A LA BASE DE DE DONNEES MYSQL */

const dotenv = require("dotenv");
var mysql = require("mysql");

//Configuration du plugin dotenv (masquage des données de connexion à la DBbase via un fichier dotenv et une création de variables pour le nom du user, le password et le nom de la base de données)
dotenv.config();
var connection = mysql.createConnection({
    host : "localhost",
    user: process.env.DB_USER,
    password : process.env.DB_PASS,
    database : process.env.DB_DATABASE
});

//Connexion à MySQL
connection.connect(function(error) {
    if (error) {
        console.error("La connexion à MySQL a échoué !"); 
        return;
    }
    console.log("Connexion à MySQL réussie !");
});

 module.exports = connection;                  
 