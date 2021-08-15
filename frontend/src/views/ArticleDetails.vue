<!--PAGE AFFICHANT LES DETAILS D'UN ARTICLE SELECTIONNE, SES COMMENTAIRES, ET PERMETTANT SUPPRESSION ET MODIFICATION-->

<template>
    <main>
        <div class="jumbotron container articlePage">
            <div id="header">
                <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary" id="arrow-only" aria-label="Lien vers la page d'accueil"><i class="fas fa-arrow-left"></i></button></router-link>
                <h1 class="articlePage__title">{{ title }}</h1>
            </div>
            <div class="row articlePage__box">
                <div v-if="currentArticle[0]" class="container col-12 col-md-10">
                    <div class='row'>
                        <div class="col-12 col-lg-11 article-item">
                            <!--Importation du component ArticlesItem-->
                            <ArticlesItem 
                                :key="currentArticle[0].title"
                                :id="currentArticle[0].id"
                                :title="currentArticle[0].title"
                                :slug="currentArticle[0].slug"
                                :description="currentArticle[0].description"
                                :subject="currentArticle[0].subject"
                                :lien_web="currentArticle[0].lien_web"
                                :username="currentArticle[0].username"
                                :date_post="currentArticle[0].date_post"
                                :presenceOfLinks="presenceOfLinks"
                                :sendLike="sendLike"
                                :sendDislike="sendDislike"
                                :deleteThumb="deleteThumb"
                                :liked="liked"
                                :disliked="disliked"
                                :totalLikes="totalLikes"
                                :totalDislikes="totalDislikes" />
                            <h3 id="comments-title">{{ messageComments }}</h3>
                            <ul id="commentsList">
                                <!--Boucle sur le tableau des commentaires récupérés depuis la base de données-->
                                <li v-for="comment in comments" :key="comment.id">
                                    <!--Importation du component CommentsItem-->
                                    <CommentsItem
                                        :id="comment.id"
                                        :cryptoslug="comment.cryptoslug"
                                        :user_id="comment.user_id"
                                        :content="comment.content"
                                        :username="comment.username"
                                        :date_post="comment.date_post"
                                        :slug="currentArticle[0].slug" />
                                </li>
                            </ul>                        
                        </div>
                    </div>
                </div>
                
                <!--La section suivante des boutons "suppression" et "modification" ne s'affiche que si le user est celui qui a posté l'article' à l'origine ou s'il est administrateur-->
                <div v-if="validUser || isAdmin" class="col-12 col-md-2 action valid">
                    <button type= "button" class="btn btn-primary action__btn" @click="showUpdate"><i class="far fa-edit"></i> Modifier</button><br/>
                    <p class="text">{{ messageUpdate }}</p>
                    <button type= "button" class="btn btn-primary btn-suppress action__btn" @click="confirmDelete"><i class="far fa-trash-alt"></i> Supprimer</button>
                    <!--Message qui ne s'affiche que quand le user clique sur le bouton "suppression"-->
                    <div v-if="confirmation" class="confirmation">
                        <p class="text">Êtes-vous sûr de vouloir supprimer ce post ?</p>
                        <button type= "button" class="btn btn-primary" @click="deleteArticle">Supprimer</button>
                        <button type= "button" class="btn btn-primary cancel-btn" @click="refreshPage">Annuler</button>
                    </div>
                    <router-link to="/articles" class="valid__return" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Retour à la liste</button></router-link>
                    <router-view />
                </div>
                <!--La section suivante s'affiche si le user est un user lambda, qui n'est pas l'auteur de l'article ni l'administrateur-->
                <div v-else class="action invalid">
                    <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Retour à la liste</button></router-link>
                    <router-view />
                </div>
            </div>
       
        
            <!--Formulaire qui ne s'affiche que quand le user clique sur le bouton "modifier"-->
            <div v-if="askForUpdate">
               <div role="form" class="container text-center formUpdate">
                    <h2 >Pour modifier cet article, merci de remplir les champs suivants :</h2>
                    <div class="row">
                        <div class="col-12 col-md-9 text-center formUpdate__box ">
                            <div class="form-group">
                                <label for="title">Titre</label>
                                <input 
                                       type="text" 
                                       class="form-control"
                                       required
                                       v-model="currentArticle[0].title"
                                       name="title" />
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea 
                                        type="textarea" 
                                        rows="5"
                                        cols="30"
                                        class="form-control"
                                        v-model="currentArticle[0].description"
                                        name="description"
                                        id="description"/>
                            </div>
                            <div class="form-group">
                                <select name="subject" v-model="currentArticle[0].subject">
                                    <option value="">--Choisissez un sujet--</option>
                                    <option value="Economie">Economie</option>
                                    <option value="Politique">Politique</option>
                                    <option value="Média">Média</option>
                                    <option value="Societé">Société</option>
                                    <option value="Psychologie">Psychologie</option>
                                    <option value="Climat">Climat</option>
                                    <option value="Sport">Sport</option>
                                    <option value="Culture">Culture</option>
                                    <option value="Santé">Santé</option>
                                    <option value="Autre">Autre</option>
                                </select>
                                <span> Sujet de l'article : </span>
                            </div>
                            <div class="form-group">
                                <div class="col-12 justify-content-center text-center">
                                    <img :src="newImage" class="w-50 rounded">
                                </div>
                                <div class="col-12 justify-content-center">
                                <div class="form-group justify-content-center">
                                    <label for="File">Choisir une nouvelle photo</label>
                                    <input @change="selectFile()" type="file" ref="file" name="image" class="form-control-file" id="File" accept=".jpg, .jpeg, .gif, .png">
                                </div>
                            </div>
                            </div>
                            <div class="form-group">
                                <label for="lien-web">Lien web de l'article</label>
                                <input 
                                       type="text" 
                                       class="form-control"
                                       v-model="currentArticle[0].lien_web"
                                       name="lien-web" />
                            </div>
                            <button class="btn btn-success" @click="updateArticle" aria-label="Valider">Enregistrer vos modifications</button>
                        </div>
                    </div>
                </div>
                
                
            </div>

            <!--Importation du component Identification-->
            <Identification
                :logout="logout"
                :isUserAdmin="isUserAdmin"
                :isLoggedIn="isLoggedIn" />
        </div>
        <!--Importation du component Footer-->
        <Footer />
    </main>
</template>


<script>
import Footer from "../components/Footer"
import Identification from "../components/Identification"
import ArticlesItem from "../components/ArticlesItem"
import CommentsItem from "../components/CommentsItem"
import ArticlesDataServices from "../services/ArticlesDataServices"
import CommentsDataServices from "../services/CommentsDataServices"
import ThumbsDataServices from "../services/ThumbsDataServices"
import { mapGetters, mapState } from 'vuex'
    
export default {
    name: "ArticleDetails",
    components: {
		Footer, ArticlesItem, CommentsItem, Identification//, ItemForm
	},
    data () {
        return {
            title: "Cet article vous intéresse ? Découvrez-le en détails...",
            currentArticle: [],
            comments: [],
            messageComments: "",
            validUser: false,
            askForUpdate: false,
            confirmation: false,
            messageUpdate: "",
            liked: false,
            disliked: true,
            thumbs: [],
            totalLikes: 0,
            totalDislikes: 0,
            presenceOfLinks: true
        }
    },
    computed: {
        //Utilisation de Vuex pour déterminer les rôles et les autorisations du user (toutes ces informations étant conservées dans le store Vuex)
        ...mapGetters(['isLoggedIn']),
        ...mapGetters(['isUserAdmin']),
        ...mapState({ token: "token"}),
        ...mapState({ userId: "userId"}),
        ...mapState({ isAdmin: "isAdmin"})
    },
    methods: {
        /**
        *Fonction d'affichage d'un article particulier via une requête Axios GET
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        */
        getOneArticle(slug, Authorization) {
            Authorization = `Bearer ${this.token}`;
            //Fonction qui déclenche la requête GET via Axios
            ArticlesDataServices.getOne(slug, { Authorization }) 
                .then(response => {
                    this.currentArticle = JSON.parse(JSON.stringify(response.data.data));
                    if (this.currentArticle[0].lien_web === null || this.currentArticle[0].lien_web === undefined || this.currentArticle[0].lien_web === "") {
                        this.presenceOfLinks = false;
                    }
                    localStorage.setItem("articleId", this.currentArticle[0].id);
                    //Vérification de l'autorisation du user : si le user courant est l'auteur de l'article ou l'administrateur, les boutons "suppression" et "modification" s'affichent (et le user peut agir sur l'article), sinon ils restent masqués
                        if (this.currentArticle[0].user_id !== this.userId) {
                            this.validUser = false;  
                        } else if (this.isAdmin == 1) {
                            this.validUser = true;
                        } else {
                            this.validUser = true;
                        }
                })
                .catch(error => console.log(error));
        },
        selectFile() {
            this.file = this.$refs.file.files[0];
            this.newImage = URL.createObjectURL(this.file)
        },
        //Fonction d'affichage du formulaire pour modifier l'article
        showUpdate() {  
            return (this.askForUpdate = true);
        },
        //Fonction d'affichage de la demande de confirmation de suppression de l'article
        confirmDelete() {
            return (this.confirmation = true);
        },
        //Fonction de rafraichissement de la page par relance de la récupération des données de l'article
        refreshPage() {
          this.getOneArticle(this.$route.params.slug);
          this.confirmation = false;
        },
        /**
        *Fonction de modification de l'article particulier affiché via une requête Axios PUT
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        * @param {Object} data - Nouvelles données de l'article
        */
        updateArticle(slug, data, Authorization) {
            data = {
                title: this.currentArticle[0].title,
                description: this.currentArticle[0].description,
                subject: this.currentArticle[0].subject,
                images: this.currentArticle[0].images,
                lien_web: this.currentArticle[0].lien_web,
                user_id: this.currentArticle[0].user_id,
                date_post: new Date().toLocaleDateString('fr-CA'), 
            };
            Authorization = `Bearer ${this.token}`;
            //Fonction qui déclenche la requête PUT via Axios
            ArticlesDataServices.update(this.$route.params.slug, data, { Authorization }) 
                .then(response => {
                    console.log(response.data);
                    this.messageUpdate = "Cet article a été modifié avec succès.";
                    this.askForUpdate = false;
                })
            .catch(error => console.log(error));
        }, 
        /**
        *Fonction de suppression de l'article particulier affiché via une requête Axios DELETE
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        */
        deleteArticle(slug, Authorization) {
            Authorization = `Bearer ${this.token}`;
            ArticlesDataServices.delete(this.currentArticle[0].slug, { Authorization })
                .then(response => {
                    console.log(response.data);
                    this.$router.push({ path: "/articles" });
                })
                .catch(error => console.log(error));
        },
        //Fonction de déconnexion
        logout() {
            this.$store.commit("logout");
            this.$router.push({ path: "/" });
            localStorage.clear();
        },
        /**
        *Fonction d'affichage de tous les commentaires affiliés à l'article affiché via une requête Axios GET
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        */
        getAllComments(slug) {
            CommentsDataServices.getAll(slug, { Authorization: `Bearer ${this.token}`})
                .then(response => {
                    this.comments = JSON.parse(JSON.stringify(response.data.data));
                    //S'il n'y a aucun article disponible, affichage d'un message
                    if (this.comments.length !== 0) {
                        this.messageComments = "Derniers commentaires postés"; 
                    } else {
                        this.messageComments = "Il n'y a aucun commentaire pour le moment.";
                    }
                    //Vérification de l'existence d'un commentaire déjà posté par le user courant sur l'article courant. Si oui, on ajoute le slug de l'article au tableau alreadyCommented du localStorage
                    this.comments.forEach(comment => {
                        if (comment.user_id === this.userId) {
                            let previousComments = JSON.parse(localStorage.getItem("alreadyCommented"));
                            if (previousComments && previousComments.length !== 0) {
                                previousComments.push(this.currentArticle[0].slug);
                                localStorage.setItem("alreadyCommented", JSON.stringify(previousComments));   
                            } else {
                                let previousComments = [];
                                previousComments[0] = this.currentArticle[0].slug;
                                localStorage.setItem("alreadyCommented", JSON.stringify(previousComments)); 
                            }
                        }
                    });
                })
                .catch(error => console.log(error));
        },
        /**
        *Fonction d'envoi d'un like à propos de l'article affiché via une requête Axios POST, et de mise à jour du total affiché des likes
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        * @param {Object} data - UserId et thumb = 1 pour le like 
        */
        sendLike(slug, data, Authorization) {
            data = {
                user_id: this.userId,
                thumb: 1, 
            };
            Authorization = `Bearer ${this.token}`;
            slug = this.$route.params.slug;
            //Fonction qui déclenche la requête POST via Axios e
            ThumbsDataServices.postThumb(slug, data, { Authorization }) 
                .then(response => {
                    console.log(response.data);
                    this.liked = true;
                    this.totalLikes += 1;
                })
                .catch(error => console.log(error));
        },
        /**
        *Fonction d'envoi d'un dislike à propos de l'article affiché via une requête Axios POST, et de mise à jour du total affiché des dislikes
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        * @param {Object} data - UserId et thumb = -1 pour le dislike 
        */
        sendDislike(slug, data, Authorization) {
            data = {
                user_id: this.userId,
                thumb: -1, 
            };
            Authorization = `Bearer ${this.token}`;
            slug = this.$route.params.slug;
            //Fonction qui déclenche la requête POST via Axios
            ThumbsDataServices.postThumb(slug, data, { Authorization }) 
                .then(response => {
                    console.log(response.data);
                    this.disliked = true;
                    this.totalDislikes += 1;
                })
                .catch(error => console.log(error));
        },
        /**
        *Fonction de suppression du like ou du dislike posté par le user courant à propos de l'article affiché (via une requête Axios DELETE), et de mise à jour du total des likes ou dislikes correspondant
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        */
        deleteThumb(Authorization) {
            Authorization = `Bearer ${this.token}`;
            //Fonction qui déclenche la requête DELETE via Axios
            ThumbsDataServices.delete(this.$route.params.slug, { Authorization })
                .then(response => {
                    console.log(response.data);
                    if (this.liked) {
                        this.liked = false;
                        this.totalLikes -= 1;
                    } else if (this.disliked) {
                        this.disliked = false;
                        this.totalDislikes -= 1;
                    }
                })
                .catch(error => console.log(error));
        },
        /**
        *Fonction d'affichage des totaux des likes et des dislikes correspondant à l'article affiché
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        * @return {Number} totalLikes - Nombre total de likes de l'article 
        * @return {Number} totalDislikes - Nombre total de dislikes de l'article
        */
        getTotalThumbs(slug, Authorization) {
            Authorization = `Bearer ${this.token}`;
            ThumbsDataServices.getAllThumbs(slug, { Authorization }) 
                .then(response => {
                    console.log(response.data.data[0]);
                    var result = JSON.parse(JSON.stringify(response.data.data[0]));
                    if (result.sumOfLikes == null) {
                        this.totalLikes = 0;
                    } else if (result.sumOfDislikes == null) {
                        this.totalDislikes = 0;
                    } else {
                        this.thumbs = JSON.parse(JSON.stringify(response.data.data[0]));
                        this.totalLikes = this.thumbs.sumOfLikes;
                        this.totalDislikes = this.thumbs.sumOfDislikes;
                    }
                })
                .catch(error => console.log(error));
        },
        /**
        *Fonction de vérification de l'existence d'un like ou d'un dislike posté par le user courant à propos de l'article affiché (pour l'empêcher de poster un nouveau commentaire s'il l'a déjà fait précédemment)
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        */
        getUserThumb(slug, Authorization) {
            Authorization = `Bearer ${this.token}`;
            ThumbsDataServices.getOneThumb(slug, { Authorization }) 
                .then(response => {
                    var result = response.data.data[0];
                    console.log(result.disliked);
                    if (result === undefined) {
                        this.liked = false;
                        this.disliked = false;
                    } else {
                        if (result.liked === 1) {
                            this.liked = true;
                            this.disliked = false;
                        } else if (result.disliked === 1) {
                            this.disliked = true;
                            this.liked = false;
                        }
                    }
                 })
                .catch(error => console.log(error));
        }
    },    
    beforeMount() {
        //Déclenchement, avant le rendu de la page, de la récupération des données de l'article, de tous les commentaires qui lui sont associés, des totaux de likes et dislikes qui le concernent, et du like ou du dislike éventuellement déjà posté par le user courant 
        this.getOneArticle(this.$route.params.slug);
        this.getAllComments(this.$route.params.slug);
        this.getTotalThumbs(this.$route.params.slug);
        this.getUserThumb(this.$route.params.slug);
        this.askForUpdate = false;
        this.validUser = false;
        this.liked = false;
        this.disliked = false;
        
    }
}
    
    
</script>

<style scoped lang="scss">
   
$color-primary: #cc2810;
$color-secondary: #324392;
 
h1 {
    margin-bottom: 40px!important;
}
    
.articlePage {
    background: url("/images/connectivite.jpeg") fixed no-repeat!important;
    z-index: 0;
    &__box {
        margin: auto;
        display: flex!important;
        flex-direction: row!important;
        justify-content: center!important;
    }
}
  
#commentsList {
   padding:0 30px;     
}

#comments-title {
    font-size: 1.2em;
}


    
.formUpdate {
    position: absolute;
    top: 20%;
    left: 15%;
    z-index: 4;
    max-width: 60%;
    background-color: #DDD;
    border-radius: 20px;
    border: 2px solid;
    margin: auto;
    padding: 20px;
    &__box {
        margin: auto;
    }
}
    
.btn-suppress {
    margin-bottom: 30px;
}
    
#arrow-only {
    display: none;
}

.cancel-btn {
        margin-left: 20px!important;
}
    
.confirmation {
    background: #FFF;
    border: 1px solid;
    padding: 10px;
    border-radius: 5px;
    position: absolute;
    bottom: 75%;
    right: 5%;
    width: 110%;
    & button {
        width: 120px;
        margin-bottom: 10px;
        margin-left: 0!important;
    }
}
    
.text {
    font-style: italic;
}
    
.invalid {
    margin: auto;
    margin-top: 20px;
}
    
   
/*ANIMATION A L'ARRIVEE SUR LA PAGE*/    

    
.articlePage__title {
    animation: reverseRevelation 700ms both ease-in-out;
}
.articlePage__box {
    animation: revelation 700ms both ease-in-out;
} 
    
.action {
    animation: lateralRevelation 700ms both ease-in-out;
} 
    
.formUpdate {
    animation: opacity 700ms both ease-in-out;
}
    
    
/*MEDIA QUERIES POUR ASSURER UNE MISE EN PAGE RESPONSIVE */
    
//Média query pour adapter la page à la tablette
@media screen and (min-width : 768px) and (max-width : 1024px) { 
     h1 {
        margin-bottom: 30px!important;
        margin-top: 80px!important;
    }
    #header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 60px!important;
    }
    .articlePage__box {
        display: flex!important;
        flex-direction: column!important;
    }
    #arrow-only {
        display: block;
    } 
    .valid__return {
        display: none;
    }
    #comments-title {
        font-size: 1.1em;
    }
    .action {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: auto;
        margin-top: 20px;
        &__btn {
            width: 200px!important;
        }
    }
    .formUpdate {
        margin: auto!important;
        max-width: 80%;
        margin-left: -5%!important;
        top: 50%;
        z-index: 6;
        &__box {
            margin: auto;
        }
    }
    .cancel-btn {
        margin-left: 20px!important;
    } 
    .confirmation {
        bottom: 50%;
        left: -100%!important;
        width: 300%!important;
        & button {
            width: 120px;
            margin-left: 5px!important;
        }
    }
}
   
    
//Média query pour adapter la page au smartphone   
@media screen and (max-width : 768px) {  
    h1 {
        margin-bottom: 30px!important;
        margin-top: 40px!important;
    }
    #header {
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-top: 110px!important;
    }
    .action {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: auto;
        margin-top: 20px;
    }
    .btn-suppress {
        margin-bottom: 0!important;
    }
    #comments-title {
        font-size: 1.1em;
    }
    #arrow-only {
        display: block;
    } 
    .formUpdate {
        left: 5%;
        max-width: 90%;
        top: 70%;
        &__box {
            margin: auto;
        }
    }
    .cancel-btn {
        margin-left: 20px!important;
    }
    .confirmation {
        bottom: 50%;
        right: 10%;
        width: 80%;
        & button {
            width: 120px;
            margin-left: 5px!important;
        }
    }
    .text {
        color: $color-primary;
        font-style: italic;
    }
}
</style>


