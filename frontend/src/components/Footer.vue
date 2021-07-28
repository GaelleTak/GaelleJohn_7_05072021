<!--COMPONENT AFFICHANT LE FOOTER, PRESENT SUR TOUTES LES PAGES-->

<template>
    <footer>
        <div class="container footer">
            <div class="row footer__box">
                    <div class="col-md-2">
                        <!--Petit logo s'affiche quand on est sur écran desktop-->
                        <img src="/images/icon.png" width="100" alt="Petit logo Groupomania" aria-label="Logo Groupomania" class="footer__logo img-narrow"/>
                        <!--Grand logo s'affiche quand on est sur tablette ou smartphone-->
                        <img src="/images/icon-left-font.png" width="250" alt="Grand logo Groupomania" class=" footer__logo navbar-brand img-large" aria-label="Logo Groupomania" />
                    </div>
                </div>
            </div>
    </footer>
</template>

<script>
export default {
  name: 'Footer',
  props: {
  }
}
</script>

<style scoped lang="scss">
   
$color-primary: black;
$color-secondary: #324392;
$color-footerbkg: white;
    
.footer {
    background: $color-footerbkg;
    color: #aaa;
    margin-top: 2em;
    min-width: 100%!important;
}
  
  
.img-large {
    display: none!important;
}
    
.img-narrow {
    display: block!important;
    margin-left: 300%;
}
 
/*ANIMATION A L'ARRIVEE SUR LA PAGE*/    

.footer {
    animation: revelation 700ms both ease-in-out;
}
  
/*MEDIA QUERIES POUR ASSURER UNE MISE EN PAGE RESPONSIVE */
    

//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {  
    .img-large {
        display: block!important;
        margin-left: auto;
        margin-right: auto;
        margin-top: 0em;

    }
    .img-narrow {
        display: none!important;
    }
}

</style>


