/*LOGIQUE METIER POUR CE QUI CONCERNE LES REQUETES SUR LES ARTICLES POSTES */


const Article = require("../models/Article"); 
var db = require("../services/mysql.config.js");
const {body} = require('express-validator');
const jwt = require("jsonwebtoken");
var slug = require("slug");
const fs = require('fs');


//Fonction de validation des inputs pour les requêtes post et put
exports.validate = (method) => {
  switch (method) {
    case 'createArticle': {
     return [ 
        body('title').exists().isAlpha(),
        body('description').optional().isAlpha(),
        body('subject').exists().isAlpha(),
        body('images').optional().isURL(),
        body('lien_web').optional().isURL()
       ]   
    }
    case 'modifyArticle': {
     return [ 
        body('title').exists().isAlpha(),
        body('description').optional().isAlpha(),
        body('subject').exists().isAlpha(),
        body('images').exists().isURL(),
        body('lien_web').optional().isURL()
       ]   
    }  
  }
}

/*REMARQUE : dans toutes les requêtes suivantes, sont utilisés des placeholders et des "escaped variables" pour éviter les attaques par injection SQL */


//Fonction qui gère la logique métier de la route POST (ajout d'un nouvel article)
exports.createArticle = (req, res, next) => {
    let sql = `INSERT INTO Articles(title, slug, description, subject, images, lien_web, user_id, date_post) VALUES (?)`;
    //Création d'un slug composé du titre de l'article + la date du post de l'article
    let newSlug = slug((req.body.slug + new Date().toLocaleDateString('fr-CA')), { lower: true });
    let values = [req.body.title, newSlug, req.body.description, req.body.subject, req.body.images, req.body.lien_web, req.body.user_id, req.body.date_post];
    let imagePost = "";if (req.file) { 
        imagePost = `${req.protocol}://${req.get("host")}/images/${req.file.filename}` 
    }
    db.query(sql, [values], function(err, data, fields) {
        if (err) {
            return res.status(400).json({err});
        }
        res.json({status: 201, data, message: "Nouvel article posté avec succès !"})
    });
};
 
 
//Fonction qui gère la logique métier de la route PUT (modification d'un article posté par son auteur, sélectionné par son slug)
 exports.modifyArticle = (req, res, next) => {
     //Recherche dans la BDD de l'article à modifier
    console.log(req.params.slug);
    let sql = "SELECT * FROM Articles WHERE cryptoslug = ?";
    db.query(sql, [req.params.cryptoslug], function(err, data) {
        if (err) {
            return res.status(400).json({err});
        }
        var articleToModify = data[0];
        //Comparaison de l'id du user courant avec l'id du user ayant posté l'article
        if (articleToModify.user_id === req.user.userId || req.user.isAdmin === 1) {
            //Création du nouveau slug correspondant au nouveau titre
            let sql = `UPDATE Articles SET title = ?, slug = ?, description = ?, subject = ?, images = ?, lien_web  = ?, user_id = ?, date_post = ? WHERE cryptoslug = ?`;
            let values = [req.body.title, newSlug, req.body.description, req.body.subject, req.body.images,req.body.lien_web, req.body.user_id, req.body.date_post, req.params.cryptoslug];
            db.query(sql, values, function(err, data, fields) {
                if (err) {
                    return res.status(400).json({err});
                }
                res.json({status: 201, data, message: "Article modifié !"})
            });
        } else {
            throw "La modification de l'article n'est possible que par son auteur.";
        }
    });
}; 

        
//Fonction qui gère la logique métier de la route DELETE (suppression d'un article posté, sélectionné par son slug)
exports.deleteArticle = (req, res, next) => {
    //Recherche dans la BDD de l'article à modifier
    console.log(req.params.slug);
    let sql = "SELECT * FROM Articles WHERE slug = ?";
    db.query(sql, [req.params.slug], function(err, data) {
        if (err) {
            return res.status(400).json({err});
        }
        var articleToModify = data[0];
        //Comparaison de l'id du user courant avec l'id du user ayant posté l'article
        if (articleToModify.user_id === req.user.userId || req.user.isAdmin === 1) {
              let sql = "UPDATE Articles SET deleted = true WHERE slug = ?";
              db.query(sql, [req.params.slug], function(err, data) {
                if (err) {
                    return res.status(400).json({err});
                }
                res.json({status: 200, data, message: "Article supprimé avec succès !"})
              });
        } else {
            throw "La suppression de l'article n'est possible que par son auteur.";
        }
    });
};


//Fonction qui gère la logique métier de la route GET (affichage de tous les articles)
exports.getAllArticles = (req, res, next) => {
  let sql = "SELECT Articles.id, title, slug, description, subject, images, lien_web, date_post, username FROM Articles INNER JOIN Users ON Articles.user_id = Users.id WHERE Articles.deleted = false ORDER BY date_post DESC"; 
  db.query(sql, function(err, data) {
    if (err) {
        return res.status(400).json({err});
    } 
    res.json({status: 200, data, message: "Articles affichés avec succès !"})
  });
};


//Fonction qui gère la logique métier de la route GET (affichage d'un article en particulier, sélectionné par son slug)
exports.getOneArticle = (req, res, next) => {
    let sql = "SELECT * FROM Articles INNER JOIN Users ON Articles.user_id = Users.id WHERE Articles.slug = ?";
    db.query(sql, [req.params.slug], function(err, data, fields) {
    if (err) {
        return res.status(404).json({err});
    }
    res.json({status: 200, data, message: "Article affiché avec succès !"})
  });
};



