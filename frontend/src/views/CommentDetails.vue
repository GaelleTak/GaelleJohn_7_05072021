<!--PAGE AFFICHANT LES DETAILS D'UN COMMENTAIRE SELECTIONNE, ET PERMETTANT SUPPRESSION ET MODIFICATION-->

<template>
   <main>
        <div class="jumbotron container comment">
            <h1 class="comment__msg">{{ message }}</h1><!--Message de suppression ou de modification du commentaire-->
            <div class="row">
                <div class="container col-12 col-md-10">
                    <div class='row'>
                        <div v-if="!deleted" div class="col-12 col-md-9 comment__box">
                            <!--Importation du component CommentsItem-->
                            <CommentsItem
                                :id="currentComment.id"
                                :cryptoslug="currentComment.cryptoslug"
                                :content="currentComment.content"
                                :username="currentComment.username"
                                :user_id="currentComment.user_id"
                                :date_post="currentComment.date_post"
                                :slug="currentComment.slug" />
                        </div>
                        <div class="comment__btnBox">
                            <!--La section des boutons "suppression" et "modification" ne s'affiche que si le user est celui qui a posté le commentaire à l'origine ou s'il est administrateur-->
                            <div v-if="validUser && !deleted" class="comment__btns">
                                <button @click="showUpdate" type= "button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                                <button @click="suppressComment" type= "button" class="btn btn-primary"><i class="far fa-trash-alt"></i></button>
                            </div>

                            <div>
                                <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Retour à la liste</button></router-link>
                                <router-view />
                            </div>
                        </div>
                        <!--Formulaire qui ne s'affiche que quand le user clique sur le bouton "modifier"-->
                        <div v-if="updateIsAsked" class="formUpComment container">
                            <h2 class="formUpComment__title">Mettez à jour votre commentaire :</h2>
                            <div class="row">
                                <div class="col-12 col-md-9 text-center formUpComment__box">
                                    <div class="form-group">
                                        <label for="content"></label>
                                        <textarea
                                            type="textarea" 
                                            rows="5"
                                            cols="30"
                                            class="form-control"
                                            required
                                            v-model="currentComment.content"
                                            placeholder="content"
                                            name="content" />
                                    </div>
                                    <button class="btn btn-success" @click="updateComment">Valider</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--Importation du component Identification-->
        <Identification
            :logout="logout"
            :isUserAdmin="isUserAdmin"
            :isLoggedIn="isLoggedIn" />
    
        <!--Importation du component Footer-->
        <Footer />
    </main>
</template>

<script>
import Footer from "../components/Footer"
import Identification from "../components/Identification"
import CommentsItem from "../components/CommentsItem"
import CommentsDataServices from "../services/CommentsDataServices"
import { mapGetters, mapState } from 'vuex'
    
export default {
    name: "CommentDetails",
    components: {
        Footer, CommentsItem, Identification
    },
    data () {
        return { 
            message: "",
            deleted: null,
            currentComment: {
                id: 0,
                cryptoslug: "",
                content: "",
                username: "",
                user_id: 0,
                date_post: "",
                slug:""
            },
            alreadyCommented: false,
            validUser: false,
            updateIsAsked: false,
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
        *Fonction de récupération d'un commentaire particulier via une requête Axios GET
        * @param {String} cryptoslug - Slug du commentaire concerné, visible dans l'URL
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        * @return {Object} currentComment - Données du commentaire
        */
       getOneComment(cryptoslug, slug, Authorization) {
            Authorization = `Bearer ${this.token}`;
           //Fonction qui lance la requête GET via Axios
            CommentsDataServices.getOne(this.$route.params.cryptoslug, this.$route.params.slug, { Authorization }) 
                .then(response => {
                    this.currentComment = JSON.parse(JSON.stringify(response.data.data[0]));
                    //Vérification de l'autorisation du user : si le user courant est l'auteur du commentaire ou l'administrateur, les boutons "suppression" et "modification" s'affichent (et le user peut agir sur le commentaire), sinon ils restent masqués
                    if (this.currentComment.user_id == this.userId || this.isAdmin === 1) {
                        this.validUser = true;  
                    } else {
                        this.validUser = false;
                    }               
                })
                .catch(error => console.log(error));
        },
        //Fonction d'affichage du formulaire pour modifier le commentaire
        showUpdate() {
            this.updateIsAsked = true;
        },
        /**
        *Fonction de modification d'un commentaire particulier via une requête Axios PUT
        * @param {String} cryptoslug - Slug du commentaire concerné, visible dans l'URL
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        * @param {Object} data - Données du commentaire
        */
        updateComment(cryptoslug, slug, data, Authorization) {
            data = {
                content: this.currentComment.content,
                user_id: this.userId,
                date_post: new Date().toLocaleDateString('fr-CA'), 
            };
            console.log(data);
            Authorization = `Bearer ${this.token}`;
            //Fonction qui lance la requête PUT via Axios
            CommentsDataServices.update(this.$route.params.cryptoslug, this.$route.params.slug, data, { Authorization }) 
                .then(response => {
                    console.log(response.data);
                    this.message = "Votre commentaire a bien été modifié";
                    this.updateIsAsked = false;
                })
            .catch(error => console.log(error));
        },
        /**
        *Fonction de suppression d'un commentaire particulier via une requête Axios DELETE
        * @param {String} cryptoslug - Slug du commentaire concerné, visible dans l'URL
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {String} Authorization qui doit contenir le token 
        */
        suppressComment(cryptoslug, slug, Authorization) {
            Authorization = `Bearer ${this.token}`;
            //Fonction qui lance la requête DELETE via Axios
            CommentsDataServices.delete(this.$route.params.cryptoslug, this.$route.params.slug, { Authorization })
                .then(response => {
                    console.log(response.data);
                    this.message = "Votre commentaire a bien été supprimé";
                    this.deleted = true;
                    //Actualisation du localStorage pour permettre au user de réécrire un nouveau commentaire à l'avenir
                    let previousComments = JSON.parse(localStorage.getItem("alreadyCommented"));
                    console.log(previousComments);
                    previousComments = previousComments.filter(item => (item != this.$route.params.slug));
                    localStorage.setItem("alreadyCommented", JSON.stringify(previousComments)); 
                })
                .catch(error => console.log(error));
        },
        //Fonction de déconnexion
        logout() {
            this.$store.commit("logout");
            this.$router.push({ path: "/" });
            localStorage.clear();
        }
    }, 
    //Déclenchement de la récupération des données du commentaire avant le rendu de la page 
    beforeMount() {
        this.getOneComment(this.$route.params.cryptoslug, this.$route.params.slug);
    }
}
</script>

<style lang="scss">
    
$color-primary: #cc2810;
$color-secondary: #324392;
    
.comment {
    margin-bottom: 0!important;
    &__btns {
        display: flex;
        justify-content: space-around;
        margin-top: 10px;
        margin-bottom: 20px;
    }
    &__box {
        margin-top: 40px!important;
        margin-bottom: 120px!important;
    }
    &__btnBox {
        margin: auto!important;
        margin-top: 40px!important;
    }
    &__msg {
        margin-top: 120px;
        margin-bottom: 40px!important;
        font-size: 1.2em!important;
        color: rgb(234,236,239);
    }
}
    
.formUpComment {
    position: absolute;
    top: 10%;
    width: 50%;
    z-index: 2;
    background: #DDD;
    padding: 20px;
    margin: auto;
    border: 1px solid $color-secondary;
    &__box {
       margin: auto;
    }
    &__title {
        margin-bottom: 15px!important;
    }
}
    
h1 {
    margin-bottom: 0px!important;
}
  
    
/*ANIMATION A L'ARRIVEE SUR LA PAGE*/    

.comment {
    &__box {
    animation: leftShow 700ms both ease-in-out;
    }
    &__btnBox {
    animation: rightShow 700ms both ease-in-out;
    }     
} 
    
 
.formUpComment {
    animation: opacity 700ms both ease-in-out;
}
     
    
//Média query pour adapter la page à la tablette
@media screen and (min-width : 768px) and (max-width : 1024px) { 
    .comment__box {
        margin: auto!important;
    }
}
    
//Média query pour adapter la page au smartphone   
@media screen and (max-width : 768px) {   
    .comment__box {
        margin-bottom: 40px!important;
    }
}
    
    
</style>