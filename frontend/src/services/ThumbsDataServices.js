/*CONFIGURATION DES REQUETES AXIOS CONCERNANT LES THUMBS (LIKES OU DISLIKES).
Actions: création d'un like/dislike, suppression d'un like/dislike, affichage de tous les thumbs, affichage d'un thumb particulier.
*/

import http from "../http-common";

class ThumbsDataServices {
    getAllThumbs(slug, headers) {
        return http.get(`/articles/${slug}/thumbs`, { headers });
    }
    getOneThumb(slug, headers) {
        return http.get(`/articles/${slug}/thumbs/user`, { headers });
    }
    postThumb(slug, data, headers) {
        return http.post(`/articles/${slug}/thumbs`, data, { headers });
    }
    delete(slug, headers) {
        return http.delete(`/articles/${slug}/thumbs`, { headers });
    }
}

export default new ThumbsDataServices();