/*CONFIGURATION DES REQUETES AXIOS CONCERNANT LES ARTICLES.
Actions : CRUD (Création d'article, affichage d'un ou de tous les articles, modification et suppression d'article)
*/

import http from "../http-common";

class ArticlesDataServices {
    getAll(headers) {
        return http.get("/articles", { headers });
    }
    getOne(slug, headers) {
        return http.get(`/articles/${slug}`,{ headers }); 
    }
    create(data, headers) {
        return http.post('/articles/add', data, { headers });
    }
    update(slug, data, headers) {
        return http.put(`/articles/${slug}`, data, { headers });
    }
    delete(slug, headers) {
        return http.delete(`/articles/${slug}`, { headers });
    }
}

export default new ArticlesDataServices();


