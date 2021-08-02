<!--PAGE D'INSCRIPTION D'UN NOUVEAU USER -->

<template>
    <main class="jumbotron">
        <h1>Vous souhaitez rejoindre la communauté Groupomania ?</h1>
        <div v-if="!submitted" class="container text-center">
            <h2>Veuillez remplir les champs ci-dessous</h2>
            <!--Utilisation de Vee-Validate : ValidationObserver pour suspendre la soumission du formulaire à l'existence ou non d'erreurs-->
            <ValidationObserver v-slot="{ invalid, handleSubmit }">
                <form class="formSignup row" @submit.prevent="handleSubmit(createUser)">
                    <div class="formSignup__box col-12 col-md-7">
                        <div class="form-group ">
                            <label for="username">Votre pseudo</label>
                            <!--Utilisation de Vee-Validate : ValidationProvider, pour tester la validité des données-->
                            <ValidationProvider name="user.username" rules="required|minmax:3,10"><!--Définition des règles de validité de l'input-->
                                <div slot-scope="{ errors }">
                                    <input 
                                       type="text" 
                                       class="form-control"
                                       required
                                       v-model="user.username"
                                       name="username"
                                       placeholder="Pseudo"/>
                                    <p class="error">{{ errors[0] }}</p><!--Une erreur s'affiche si l'input ne respecte pas les règles de ValidationProvider-->
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <label for="email">Votre email</label>
                            <ValidationProvider name="user.email" rules="required|email">
                                <div slot-scope="{ errors }">
                                    <input 
                                           type="email" 
                                           class="form-control"
                                           required
                                           v-model="user.email"
                                           name="email"
                                           placeholder="Adresse email"/>
                                    <p class="error">{{ errors[0] }}</p>
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <label for="password">Votre mot de passe</label>
                            <ValidationProvider name="user.password" rules="required|minmax:3,10">
                                <div slot-scope="{ errors }">
                                    <input 
                                       type="password" 
                                       class="form-control"
                                       minlength="6"
                                       maxlength="10"
                                       required
                                       v-model="user.password"
                                       name="password"
                                       placeholder="Mot de passe"/>
                                    <p class="error">{{ errors[0] }}</p>
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <label for="first-name">Votre prénom</label>
                            <ValidationProvider name="user.first-name" rules="required|minmax:3,15">
                                <div slot-scope="{ errors }">
                                    <input 
                                       type="text" 
                                       class="form-control"
                                       v-model="user.first_name"
                                       name="first-name"
                                       placeholder="Prénom"/>
                                    <p class="error">{{ errors[0] }}</p>
                                </div>
                            </ValidationProvider>
                        </div>
                        <div class="form-group">
                            <label for="last-name">Votre nom</label>
                            <ValidationProvider name="user.last-name" rules="required|minmax:3,15">
                                <div slot-scope="{ errors }">
                                    <input 
                                       type="text" 
                                       class="form-control"
                                       v-model="user.last_name"
                                       name="last-name"
                                       placeholder="Nom"/>
                                    <p class="error">{{ errors[0] }}</p>
                                </div>
                            </ValidationProvider>
                        </div>

                        <button class="btn btn-success btn-submit" type="submit" value="Submit" v-bind:disabled="invalid">Créer votre compte</button><!--Le bouton reste grisé tant qu'il y a des erreurs, imposant au user de les corriger-->     
                    </div>
                </form>
            </ValidationObserver>
        </div>

          <!--Importation du component Identification-->
        <Identification
            :logout="logout"
            :isUserAdmin="isUserAdmin"
            :isLoggedIn="isLoggedIn" />

        <div>
            <!--Importation du component Footer-->
            <Footer />
        </div>
    </main>
</template>


<script>
import Footer from "../components/Footer"
import UsersDataServices from "../services/UsersDataServices"
import { mapMutations } from 'vuex'
import { ValidationProvider, ValidationObserver } from 'vee-validate'
    
export default {
    name: 'Signup',
    components: {
        Footer, ValidationProvider, ValidationObserver
    },
    data () {
        return {
                user: {
                    username: "",
                    email: "",
                    password: "",
                    first_name: "",
                    last_name: ""
                },
            submitted: false,
            foundError: false,
            errors: []
        }
    },
    methods: {
        //Utilisation de Vuex pour déterminer les rôles et les autorisations du user (toutes ces informations étant conservées dans le store Vuex)
        ...mapMutations([
            'setUserId',
            'setToken',
            'setIsAdmin'
        ]),
        /**
        *Fonction de création d'un nouvel utilisateur
        * @param {Object} data - Données de l'utilisateur
        */
        createUser() { 
            var data = {
                username: this.user.username,
                email: this.user.email,
                password: this.user.password,
                first_name: this.user.first_name,
                last_name: this.user.last_name
            };
            //Fonction qui lance la requête Axios POST
            UsersDataServices.signup(data) 
                .then(response => {
                    console.log(response.data);
                    this.setUserId(response.data.userId);
                    this.setToken(response.data.token);
                    this.setIsAdmin(response.data.isAdmin);
                    this.submitted = true;
                    this.$router.push('/');
                })
                .catch(error => console.log(error));
        }
    }
}
</script>


<style scoped lang="scss">
    
$color-primary: #cc2810;
$color-secondary: #324392;    
 
#newUser {
    font-size: 2.5em;
    color: $color-secondary;
}

h2 {
    margin-top: 1em;
    margin-bottom: 0px!important;
}
    
.formSignup__box {
    margin: auto!important;
    margin-top: 30px!important;
}
    
.error {
    font-weight: bold;
    color: $color-primary;
}
    
.btn-submit {
    margin-top: 20px!important;
    margin-bottom: 40px!important;
}


footer{
    margin-bottom: -4em;
}

    
</style>

