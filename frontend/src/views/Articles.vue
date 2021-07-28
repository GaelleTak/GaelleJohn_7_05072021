<!--PAGE D'ACCUEIL DU FORUM ARTICLES PRESENTANT LA LISTE COMPLETE DES ARTICLES-->

<template>
    <main>
        <div class="jumbotron articles">
            <h1>Plateforme de partage d'articles</h1>
            <div>
                <h2>Derniers articles postés</h2>
                    <div class="search">
                        <label class="search__text">Recherche par thème : </label>
                        <select class="search__select" name="subject" v-model="search">
                            <option value="">Choisir dans la liste</option>
                            <option value="Economie">Economie</option>
                            <option value="Politique">Politique</option>
                            <option value="Média">Médias</option>
                            <option value="Société">Société</option>
                            <option value="Psychologie">Psychologie</option>
                            <option value="Climat">Climat</option>
                            <option value="Sport">Sport</option>
                            <option value="Culture">Culture</option>
                            <option value="Santé">Santé</option>
                            <option value="Autre">Autre</option>
                        </select>
                    </div>
                    <div class="container">
                        <div class='row articles__box'>
                            <ul class="col-12 col-lg-9">
                                <!--Boucle sur le tableau des articles filtrés-->
                                <li v-for="article in filteredArticles" :key="article.title" class="articles-item">
                                    <!--Importation du component ArticlesItem-->
                                    <ArticlesItem 
                                    :id="article.id"
                                    :title="article.title"
                                    :slug="article.slug"
                                    :description="article.description"
                                    :subject="article.subject"
                                    :lien_web="article.lien_web"
                                    :username="article.username"
                                    :date_post="article.date_post" 
                                    />
                                </li>
                            </ul>
                            <div class="col-12 col-lg-3">
                                <router-link to="/articles/add" aria-label="Poster un nouvel article"><button  type= "button" class="btn btn-primary btn-add"><i class="far fa-plus-square"></i> Poster un nouvel article</button></router-link>
                            </div> 
                        </div>
                    </div>
                <p v-if="articles.length == 0">{{ message }}</p>
            </div>
            <!--Importation du component CallToLogin-->
            <CallToLogin v-if="!isLoggedIn" />
            <!--Importation du component Identification-->
            <Identification
                :logout="logout"
                :isUserAdmin="isUserAdmin"
                :isLoggedIn="isLoggedIn"
                  />
        </div> 
        <!--Importation du component Footer-->
        <Footer />
    </main>
</template>

<script>
import Footer from "../components/Footer"
import Identification from "../components/Identification"
import CallToLogin from "../components/CallToLogin"
import ArticlesItem from "../components/ArticlesItem"
import ArticlesDataServices from "../services/ArticlesDataServices"
import { mapGetters, mapState } from 'vuex'
        
export default {
    name: "Articles",
    components: {
		Footer, ArticlesItem, CallToLogin, Identification, 
	},
    data () {
        return {
            articles:[],
            activeArticle: null,
            message: "Il n'y a aucun article posté sur la plateforme à ce jour.",
            search:""
        }
    },
   computed: {
       //Utilisation de Vuex pour déterminer les rôles et les autorisations du user (toutes ces informations étant conservées dans le store Vuex)
        ...mapGetters(['isLoggedIn']),
        ...mapGetters(['isUserAdmin']),
        ...mapState({ token: "token"}),
       //Fontion de filtrage des articles par sujet
        filteredArticles() {
            return this.articles.filter(article => {
            return article.subject.includes(this.search);
            })
        }
    },
    methods: {
        /**
        *Fonction d'affichage de la liste de tous les articles via une requête Axios GET
        * @param {String} Authorization qui doit contenir le token 
        * @return {Array} articles - Liste des articles de la base de données 
        */
        getAllArticles() {
            //Fonction qui lance la requête GET via Axios
            ArticlesDataServices.getAll({ Authorization: `Bearer ${this.token}`})
                .then(response => {
                this.articles = JSON.parse(JSON.stringify(response.data.data));
                })
                .catch(error => console.log(error));
        },
        //Fonction de déconnexion;
        logout() {
            this.$store.commit("logout");
            this.$router.push({ path: "/" });
            localStorage.clear();
        }
    },
    //Déclenchement de la récupération de la liste d'articles avant le rendu de la page 
    beforeMount() {
        this.getAllArticles();
    }
};
    
</script>

<style lang="scss">   
 
$color-primary: #cc2810;
$color-secondary: #324392;
       
.articles {
    width: 100%;
    margin: auto;
    margin-bottom: 0!important;
    background: url("/images/connectivite.jpeg") fixed no-repeat!important;
    background-size: cover!important;
 }

h1,h2{
    color: white;
    background: rgb(175, 175, 215 );
    box-sizing: border-box;
    width: 100%;
    border: solid 10px;
}

.search {
    margin-bottom : 20px;
    &__text {
        margin-right: 10px;
        font-weight: 900;
        font-size: 2em;
        color: white;
    }
    &__select {
        outline: solid; 
        border: 1;
        text-align: center;
        font-size: 1em;
    }
}
    
ul, li {
    list-style: none;
    width: 100%;
    margin: auto!important;
}

a {
    height: 50px;
    margin-top: 40px!important;
}
    
.btn-add {
    min-width: 150px;
}

.btn-primary{
    color: white;
}

    
/*ANIMATION A L'ARRIVEE SUR LA PAGE*/    

.articles-item {
    animation: revelation 700ms both ease-in-out;
} 
    
.btn-add {
    animation: lateralRevelation 700ms both ease-in-out;
} 
    
    
/*MEDIA QUERIES POUR ASSURER UNE MISE EN PAGE RESPONSIVE */
    
//Média query pour adapter la page à la tablette
@media screen and (min-width : 768px) and (max-width : 1024px) { 
    ul {
        padding: 0!important;
    }
    .articles__box {
        display: none;
        //flex-direction: column;
        //align-items: center;
    }
}
   
//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {  
    .articles__box {
        padding: 0!important;
    }
    h1 {
        margin-bottom: 0px!important;
    }
    .btn-add {
        font-size: 1em!important;
        
    }
    .card {
        line-height: 20px;
        &__body {
            padding-left: 0!important;
            padding-right: 0!important;
        }
    }
    ul {
        padding: 0!important;
    }
}

    
</style>

 