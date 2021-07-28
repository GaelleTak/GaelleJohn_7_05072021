<!--PAGE D'ACCUEIL DU FORUM GIFS, A DEVELOPPER-->

<template>
    <div>
        <div class="gifs jumbotron">
            <h1>Plateforme de partage de Gifs : A développer...</h1>
        </div>  

        <!--Importation du component CallToLogin-->
        <CallToLogin v-if="!isLoggedIn" />
        
        <!--Importation du component Identification-->
        <Identification
            :logout="logout"
            :isUserAdmin="isUserAdmin"
            :isLoggedIn="isLoggedIn" />

        <!--Importation du component Footer-->
        <Footer />
    </div>
</template>

<script>
import Footer from "../components/Footer"
import Identification from "../components/Identification"
import CallToLogin from "../components/CallToLogin"
import { mapGetters, mapState } from 'vuex'
    
export default {
    name: "Gifs",
    components: {
        Identification, Footer, CallToLogin
    }, 
    data () {
        return {
        }
    },
    computed: {
        ...mapGetters(['isLoggedIn']),
        ...mapState({ token: "token"}),
        ...mapGetters(['isUserAdmin'])
    },
    methods: {
        logout() {
            this.$store.commit("logout");
            this.$router.push({ path: "/" });
            localStorage.clear();
        }
    }
}
</script>

<style>
    
</style>