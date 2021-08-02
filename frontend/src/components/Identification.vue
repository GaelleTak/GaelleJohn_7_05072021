<!--COMPONENT AFFICHANT LE MENU DE CONNEXION/INSCRIPTION, PRESENT SUR TOUTES LES PAGES-->

<template>
    <div class="auth">
        <!--Section qui s'affiche si le user n'est pas connecté-->
        <div v-if="!isLoggedIn">
            <router-link to="/auth/signup" class="auth__signup"><button type= "button" class="btn btn-primary auth__btn"><i class="fas fa-user-plus"></i> Inscription</button></router-link><br/>
            <router-link to="/auth/login" class="auth__login"><button type= "button" class="btn btn-primary auth__btn"><i class="fas fa-sign-in-alt"></i> Connexion</button></router-link>
            <router-view />
        </div>
        <!--Section qui s'affiche si le user est connecté-->
        <div v-else class="deconnect">
            <button type="button" class="btn btn-secondary deconnect__btn" @click="logout"><i class="fas fa-sign-out-alt"></i> Déconnexion</button>
            <!--Message qui ne s'affiche que si le user est connecté et est l'administrateur-->
            <div class="admin">
                <p v-if="isUserAdmin">ADMINISTRATEUR<br/>CONNECTE</p>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: 'Identification',
    props: {
        logout: {
            type: Function,
            required: true
        },
        isUserAdmin: {
            type: Boolean,
            required: true,
            default: false
        },
        isLoggedIn: {
            type: Boolean,
            required: true,
            default: false
        }
    }
}
</script>


<style scoped lang="scss">
    
$color-primary: #cc2810;
$color-secondary: #324392; 
    
.auth {
    position: fixed;
    right: 0px;
    top: 10px;
    z-index: 4;
    width: 200px;
    &__btn {
        font-size: 0.9em!important;
    }
} 
    
.deconnect {
    position: fixed;
    right: 0px;
    top: 20px;
    z-index: 4;
    width: 200px;
    &__btn {
        font-size: 0.9em!important;
    }
}
    
.admin {
    position: fixed;
    right: 30px;
    top: 110px;
    z-index: 4;
    color:black;    
}
 
/*MEDIA QUERIES POUR ASSURER UNE MISE EN PAGE RESPONSIVE */
    
//Média query pour adapter la page à la tablette
@media screen and (min-width : 768px) and (max-width : 1024px) { 
    .auth, .deconnect {
        right: 40px;
        top: 20px;
    }
}
    
//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {  
    .auth {
        right: 25px;
        top: 10px;
    }

    .deconnect {
        right: -30px;
        top: 60px;
    }
    .btn, .btn-primary {
        font-size: 0.8em!important;
    }
    .admin {
        font-size: 0.7em;
    }
}
    
</style>