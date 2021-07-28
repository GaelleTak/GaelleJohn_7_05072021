<!--PAGE PERMETTANT DE POSTER UN NOUVEAU COMMENTAIRE-->

<template>
    <main>
        <div class="container jumbotron text-center comment">
            <!--Utilisation de Vee-Validate : ValidationObserver pour suspendre la soumission du formulaire à l'existence ou non d'une erreur-->
            <ValidationObserver v-slot="{ invalid, handleSubmit }">
                <form v-if="!submitted" class="formComment" @submit.prevent="handleSubmit(postComment)">
                    <h1>Pour ajouter un commentaire, remplissez le champ suivant :</h1>
                    <div class="row">
                        <div role="form" class="col-12 col-md-9 text-center formComment__box ">
                            <div class="form-group">
                                <!--Utilisation de Vee-Validate : ValidationProvider, pour tester la validité du content-->
                                <ValidationProvider name="comment.content" rules="required|minmax:3,300"><!--Définition des règles de validité de l'input-->
                                    <div slot-scope="{ errors }">
                                        <textarea
                                            type="textarea" 
                                            rows="5"
                                            cols="30"
                                            class="form-control"
                                            required
                                            v-model="comment.content"
                                            placeholder="Formidable !"
                                            name="content"
                                            aria-label="Contenu du commentaire" />
                                            <p class="error">{{ errors[0] }}</p><!--Une erreur s'affiche si l'input ne respecte pas les règles de ValidationProvider-->
                                    </div>
                                </ValidationProvider>
                            </div>
                            <div class="action">
                                <button class="btn btn-success btn-post" aria-label="Poster le commentaire" type="submit" value="Submit" v-bind:disabled="invalid"><i class="fas fa-check"></i> Poster ce commentaire</button>
                                <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary"><i class="fas fa-times"></i> Annuler</button></router-link>
                                <div v-if="forbidden" class="confirmation"><!--Message qui s'affiche uniquement si le "alreadyCommented" du localStorage contient le slug de l'article, donc si le user a déjà commenté cet article-->
                                    <p class="text">Vous avez déjà commenté cet article, vous ne pouvez le faire qu'une fois !</p>
                                    <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary">Retour à la liste</button></router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </ValidationObserver>
            <div v-if="submitted" >
                <p id="confirmComment">{{ message }}</p>
                <router-link to="/articles" aria-label="Lien vers la liste d'articles"><button type= "button" class="btn btn-primary">Retour à la liste</button></router-link>
                <router-view />
            </div>
        </div>

        <!--Importation du component Footer-->
        <Footer />
    </main>
</template>


<script>
import Footer from "../components/Footer"
import CommentsDataServices from "../services/CommentsDataServices"
import { mapState } from 'vuex'
import { ValidationProvider, ValidationObserver } from 'vee-validate'
    
export default {
    name: 'CommentForm',
    components: {
        Footer, ValidationProvider, ValidationObserver
    },
    data () {
        return {
            comment: {
                content: "",
                user_id: "", 
                article_id: 0,
                date_post: "",
            },
            submitted: false, 
            message:"",
            forbidden: false,
            errors: []
        }
    },
    computed: {
        //Utilisation de Vuex pour déterminer les rôles et les autorisations du user (toutes ces informations étant conservées dans le store Vuex)
        ...mapState({ token: "token"}),
        ...mapState({ userId: "userId"}),
    },
    methods: {
        /**
        *Fonction d'envoi d'un nouveau commentaire via une requête Axios POST
        * @param {String} slug - Slug de l'article concerné, visible dans l'URL
        * @param {Object} data - Contenu du formulaire
        * @param {String} Authorization qui doit contenir le token 
        */
        postComment(slug, data, Authorization) {
            let previousComments = JSON.parse(localStorage.getItem("alreadyCommented"));     
            if (previousComments && previousComments.indexOf(this.$route.params.slug) != -1) {
                this.forbidden = true;
            } else {
                data = {
                    content: this.comment.content,
                    user_id: this.userId,
                    article_id: localStorage.getItem("articleId"),
                    date_post: new Date().toLocaleDateString('fr-CA'), 
                };
                Authorization = `Bearer ${this.token}`;
                slug = this.$route.params.slug;
                //Fonction qui lance la requête Axios POST
                CommentsDataServices.create(slug, data, { Authorization }) 
                    .then(response => {
                        console.log(response.data);
                        this.submitted = true;
                        this.message = "Votre commentaire a bien été posté !"
                    })
                    .catch(error => console.log(error));
            }
        }
    }
}
            
    
</script>

<style scoped lang="scss">
 
$color-primary: #cc2810;
$color-secondary: #324392;
 
.comment {
    padding-top: 180px!important;
    padding-bottom: 120px!important;
    margin-bottom: 0!important;
    &__img {
        margin-bottom: 0px;
    }
}
 
.formComment h1 {
    margin-top: 20px!important;
    font-size: 1.5em!important;
    font-weight: bold;
    text-align: center;
    margin-bottom: 30px!important;
}
    
.formComment {
    margin: auto!important;
    padding: 20px;
    &__box {
        margin: auto!important;
    }
}
    
.error, #confirmComment {
    font-weight: bold;
}

.btn-post {
    margin-right: 20px!important;
}
    
.confirmation {
        background: #FFF;
        border: 1px solid $color-primary;
        padding: 10px;
        border-radius: 5px;
        position: absolute;
        bottom: 0%;
        margin-left: 8%!important;
        width: 80%;
}
    
.text {
    color: $color-primary;
    font-style: italic;
}


/*MEDIA QUERIES POUR ASSURER UNE MISE EN PAGE RESPONSIVE */
    
//Média query pour adapter la page à la tablette
@media screen and (min-width : 768px) and (max-width : 1024px) { 
    .confirmation {
        bottom: 0%;
    }
}  
    
//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {      
    .action {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: auto;
        margin-top: 20px;
    }
}
    
</style>