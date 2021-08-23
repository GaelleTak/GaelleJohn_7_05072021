<!--PAGE D'AJOUT D'UN NOUVEL ARTICLE-->

<template>
    <main class="jumbotron"> 
        <h1 v-if="!submitted">Vous souhaitez partager vos intérêts avec votre communauté ? C'est ici !</h1>
        <!--Utilisation de Vee-Validate : ValidationObserver pour suspendre la soumission du formulaire à l'existence ou non d'erreurs-->
            <ValidationObserver v-slot="{ invalid, handleSubmit }" v-if="!submitted" >    
                <form class="container text-center form formArticle" @submit.prevent="handleSubmit(saveArticle)">
                <h2>Pour poster un nouvel article, merci de remplir les champs suivants :</h2>
                <div class="row">
                    <div class="formArticle__box col-12 col-md-9">
                        <div class="form-group">
                            <label for="title">Titre</label>
                            <!--Utilisation de Vee-Validate : ValidationProvider, pour tester la validité des données-->
                            <ValidationProvider name="article.title" rules="minmax:3,2000"><!--Définition des règles de validité de l'input-->
                                <div slot-scope="{ errors }">
                                    <input 
                                       type="text" 
                                       class="form-control"
                                       required
                                       v-model="article.title"
                                       name="title"
                                       aria-required="true" />
                                    <p class="error">{{ errors[0] }}</p><!--Une erreur s'affiche si l'input ne respecte pas les règles de ValidationProvider-->
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <ValidationProvider name="article.description" rules="minmax:3,2000">
                                <div slot-scope="{ errors }">
                                    <textarea 
                                        type="textarea" 
                                        rows="5"
                                        cols="30"
                                        class="form-control"
                                        v-model="article.description"
                                        name="description"
                                        id="description"/>
                                    <p class="error">{{ errors[0] }}</p>
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <ValidationProvider name="article.subject" rules="required">
                                <div slot-scope="{ errors }">
                                    <select name="subject" v-model="article.subject">
                                        <option value="">--Choisissez un sujet--</option>
                                        <option value="Economie">Economie</option>
                                        <option value="Politique">Politique</option>
                                        <option value="Média">Média</option>
                                        <option value="Société">Société</option>
                                        <option value="Psychologie">Psychologie</option>
                                        <option value="Climat">Climat</option>
                                        <option value="Sport">Sport</option>
                                        <option value="Culture">Culture</option>
                                        <option value="Santé">Santé</option>
                                        <option value="Autre">Autre</option>
                                    </select>
                                    <span> Sujet de l'article : {{ article.subject }}</span>
                                    <p class="error">{{ errors[0] }}</p>
                                    
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <label for="lien-web">Lien web de l'article</label>
                            <ValidationProvider name="article.lien_web" rules="minmax:11,200">
                                <div slot-scope="{ errors }">
                                    <input 
                                       type="text" 
                                       class="form-control"
                                       v-model="article.lien_web"
                                       name="lien-web" />
                                    <p class="error">{{ errors[0] }}</p>
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="post-btns">
                            <button class="btn btn-success" type="submit" value="Submit" v-bind:disabled="invalid"><i class="fas fa-check"></i> Valider ce post</button>
                            <router-link to="/articles" class="btn-return" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Retour à la liste</button></router-link>
                            <router-view />
                        </div>
                    </div>
                </div>
            </form>
        </ValidationObserver>
        <div v-else id="afterMessage">
            <h3>Votre article a bien été posté sur la plateforme !</h3>
            <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary">Retour à la liste</button></router-link>
            <router-view />
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
import ArticlesDataServices from "../services/ArticlesDataServices"
import { mapGetters, mapState } from 'vuex'
import { ValidationProvider, ValidationObserver } from 'vee-validate'
    
export default {
    name: "PostArticle",
    components: {
		Footer, Identification, ValidationProvider, ValidationObserver
	},
    data () {
        return {
            article: {
                title: "",
                slug: "",
                description: "", 
                subject: "",
                lien_web: "",
            },
            submitted: false,
            errors: []
        };
    },
     computed: {
         //Utilisation de Vuex pour déterminer les rôles et les autorisations du user (toutes ces informations étant conservées dans le store Vuex)
        ...mapGetters(['isLoggedIn']),
        ...mapState({ token: "token"}),
        ...mapState({ userId: "userId"}),
        ...mapGetters(['isUserAdmin'])
    },
    methods: {
        /**
        *Fonction de création d'un nouvel article
        * @param {Object} data - Données du nouvel article
        * @param {String} Authorization qui doit contenir le token
        */
        saveArticle(data, Authorization) {
            data = {
                title: this.article.title,
                slug: this.article.title,
                description: this.article.description,
                subject: this.article.subject,
                lien_web: this.article.lien_web,
                user_id: this.userId,
                date_post: new Date().toLocaleDateString('fr-CA'), 
            };
            Authorization = `Bearer ${this.token}`;
            //Fonction qui lance la requête Axios POST
            ArticlesDataServices.create(data, { Authorization }) 
                .then(response => {
                    console.log(response.data);
                    this.submitted = true;
                })
                .catch(error => console.log(error));
        },
        // Fonction de déconnection
        logout() {
            this.$store.commit("logout");
            this.$router.push({ path: "/" });
            localStorage.clear();
        }
    }
}
</script>


<style scoped lang="scss">

$color-primary: #cc2810;
$color-secondary: #324392;
    
#description {
    height: 150px!important;
}

.formArticle {
    position: absolute;
    top: 25%;
    z-index: 2;
    max-width: 60%!important;
    margin-left: 15%!important;
    background-color: rgb(106, 106, 168);
    border-radius: 20px;
    border: 2px solid;
    padding: 20px;
    &__box {
        margin: auto;
    }
}
    
.error {
    font-weight: bold;
    color: $color-primary;
}

.btn-return {
    margin-left: 10px;
}
    
#afterMessage {
    padding-top: 200px;
    padding-bottom: 150px;
    & h3 {
        margin-bottom: 20px;
    }
}

footer{
    margin-bottom: -4em;
}
   
/*MEDIA QUERIES POUR ASSURER UNE MISE EN PAGE RESPONSIVE */
    
//Média query pour adapter la page à la tablette
@media screen and (min-width : 768px) and (max-width : 1024px) { 
     .formArticle {
        max-width: 90%!important;
        margin-left: 2%!important;
    }
}
    
//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {  
    .formArticle {
        max-width: 90%!important;
        margin-left: 2%!important;
    }
}
</style>




