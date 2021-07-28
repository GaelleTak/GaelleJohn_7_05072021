<!--PAGE DE BASE DU FRONTEND DE L'APPLICATION GROUPOMANIA-->                           
<template>
    <div id="app">
        <!--Menu présent sur toutes les pages quand on est sur desktop-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-white"> 
            <!--Grand logo s'affiche quand on est sur desktop-->
            <router-link to="/">
            <img src="/images/icon-left-font.png" width="400" aria-label="Logo Groupomania" alt="Logo Groupomania" class="navbar-brand img-large" />
            </router-link>
            <!--Petit logo s'affiche quand on est sur tablette ou smartphone-->
            <router-link to="/">
            <img src="/images/icon.png" width="100" alt="Site logo" class="navbar-brand img-narrow"/>
             </router-link>
            <div class="collapse navbar-collapse" id="navCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active "><router-link to="/" class="nav-link" aria-label="Lien vers la page accueil" >Accueil</router-link></li>   
                    <li class="nav-item "><router-link to="/articles" class="nav-link " aria-label="Lien vers la plateforme articles">Vos Articles</router-link></li>
                </ul>
            </div>
            <!--Bouton qui permet d'ouvrir ou de fermer un menu latéral quand on est sur smartphone ou tablette-->
            <button @click="toggleNav" type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navCollapse" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
            
        <nav v-if="toggleOn" >
            <!--Menu latéral qui s'affiche quand on est sur smartphone ou tablette-->
            <div class="menu">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><router-link to="/" class="nav-link" aria-label="Lien vers la page accueil">Accueil</router-link></li>   
                    <li class="nav-item"><router-link to="/articles" class="nav-link" aria-label="Lien vers la plateforme articles">Vos Articles</router-link></li>
                    <li class="nav-item menu__close" @click="toggleNav"><i class="far fa-window-close"></i></li>
                </ul>
            </div>
        </nav>
        <router-view />    
    </div>
</template>

<script>   
 
 export default {
	name: "App", 
    data() {
        return {
            toggleOn: false
        }
    },
    methods: {
        toggleNav() {
            this.toggleOn = !this.toggleOn;
        }
    }
}   
</script>

<style lang="scss">
    
//Déclaration variables SASS
$color-primary: #cc2810;
$color-secondary: #324392;
$color-tertiary: #6f757b;
    


#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}

.navbar-brand 
{
    margin-top: -2.5em;
}
    
button, .card__btnDetails {
    background: rgb(176, 176, 219)!important;
    border: 2px solid black!important;
    color: black!important;
}

button:hover {
    box-shadow: 2px 2px 4px $color-tertiary;
}

.auth__btn, .deconnect__btn, .account__btn, .confirm__btn, .confirmSuppress__btn {
    margin-bottom: 10px!important;
    background-color: white!important;
    border: 2px solid black!important;
}

.card__btnWeb{
    background-color: rgb(175, 175, 215)!important;
    border: none!important;
    margin-bottom: 10px!important;

}
h1 {
    font-size: 2em!important;
    margin-top: 150px!important;
    margin-bottom: 30px!important;
    font-weight: bold;
    font-family: 'Comfortaa', 'Varela', Verdana, sans-serif;
}
    
h2 {
    font-size: 1.5em!important;
    color: black;
    font-weight: bold;
    text-align: center;
    margin-bottom: 30px!important;
    font-family: 'Comfortaa', 'Varela', Verdana, sans-serif;
}
    
.navbar {
    position: fixed!important;
    width: 100%;
    padding-right: 30%!important;
    z-index: 3; 
       
}
    
.nav-link {
    color:black!important;
    position: relative;
    line-height: 20px;
    font-weight: bold;
    font-size: 1.25em;
    &::after {
        content: '';
        position: absolute;
        left: 50%;
        bottom: 0;
        transform: translateX(-50%) scaleX(0);
        transform-origin: 50% 50%;
        width: 100%;
        height: 2px;
        background-color:black;
        transition: transform 250ms;
    }
    &:hover {
        font-weight: bold!important;
        &::after {
          transform: translateX(-50%) scaleX(1);
        }
    }
}
.active {
    font-weight: bold!important;
}
    
.navbar-toggler {
    position: absolute;
    right: 10px; 
    top: 10px;
}
    
.menu {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 5;
    background: rgb(175, 175, 215);
    border-radius: 5px;
    padding: 20px;
    text-align: left;

    & a, li {
        color: #FFF;
        margin-top: 0!important;
        &:hover {
            color: $color-primary;
        }
    }
    &__close {
        text-align: right;
        font-size: 1.2em;
    }      
}
  
.img-narrow {
    display: none!important;
}

/*KEYFRAMES UTILISES SUR PLUSIEURS PAGES*/
    
@keyframes opacity {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
    
@keyframes revelation {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes reverseRevelation {
    0% {
        opacity: 0;
        transform: translateY(-20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0px);
    }
}
    
@keyframes lateralRevelation {
    0% {
        opacity: 0;
        transform: translateX(20px);
    }
    100% {
        opacity: 1;
        transform: translateX(0px);
    }
}
    
@keyframes leftShow {
    0% {
        opacity: 0;
        transform: translateX(-40px);
    }
    100% {
        opacity: 1;
        transform: translateX(0px);
    }
}
    
@keyframes rightShow {
    0% {
        opacity: 0;
        transform: translateX(40px);
    }
    100% {
        opacity: 1;
        transform: translateX(0px);
    }
}
 
/*MEDIA QUERIES POUR RENDRE LE SITE RESPONSIVE*/
    
//Média query pour adapter la page au smartphone
@media screen and (min-width : 768px) and (max-width : 1024px) { 
   .navbar-toggler {
        right: 10px; 
        top: 20px;
    }
}
    
//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {
    h1 {
        font-size: 1.4em!important;
        margin-top: 120px!important;
    }  
    .img-narrow{
        display: block!important;
        position: absolute;
        left: 0em;
    }

    .img-large{
        display: none !important;
    }
    .btn, .btn-primary {
        font-size: 0.8em!important;
    }
}    
    
</style>
