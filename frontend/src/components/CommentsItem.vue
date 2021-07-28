<!--COMPONENT CORRESPONDANT A L'AFFICHAGE D'UN COMMENTAIRE (UTILISE SUR LES PAGES ARTICLEDETAILS.VUE ET COMMENTDETAILS.VUE-->

<template>
    <div>
        <!--Section qui s'affiche si la page qui appelle ce component est celle qui affiche un commentaire en particulier-->
        <div v-if="this.$route.name == 'one-comment-details'" class="card text-center">
            <div class="card-header card__header">
                <p><i class="fas fa-comments"></i> Commentaire posté le : {{ new Date(date_post).toLocaleDateString('fr-CA') }} par {{ username }}</p>
            </div>
            <div class="card-body card__body">
                <p class="card-text card__text ">{{ content }}</p>
            </div>
        </div>
        <!--Section qui s'affiche si la page qui appelle ce component est celle qui affiche la liste complète des commentaires-->
        <div v-else class="card text-center">   
            <div class="card-header card__header">
                <p><i class="fas fa-comments"></i> Commentaire posté le : {{ new Date(date_post).toLocaleDateString('fr-CA') }} par {{ username }}</p>
                <!--Texte du bouton et icone s'affichent sur desktop-->
                <a class="btn btn-primary card__btnDetails icon-text" :href="slug + '/comments/' + cryptoslug" aria-label="Détails du commentaire"><i class="fas fa-info-circle"></i> Détails</a>
                <!--Icone seulement s'affiche sur tablette et smartphone-->
                <a class="btn btn-primary card__btnDetails icon-only" :href="slug + '/comments/' + cryptoslug" aria-label="Détails du commentaire"><i class="fas fa-info-circle"></i></a>
            </div>
            <div class="card-body card__body">
                <p class="card-text card__text ">{{ content }}</p>
            </div>
        </div> 
    </div>
</template>




<script>
    
export default {
	name: "CommentsItem",
	props: {
        id: {
            type: Number,
            required: true
        },
        cryptoslug: {
            type: String,
            required: true
        },
        user_id: {
            type: Number,
            required: true
        },
		content: {
			type: String,
			required: true
		},
		username: {
			type: String,
			required: true
		},
		date_post: {
			type: String,
			required: true
		},
        slug: {
			type: String,
			required: true
		}
	}
}
    
</script>



<style scoped lang="scss">
    
$color-primary: #cc2810;
$color-secondary: #324392;

.card {
    font-size: 0.8em!important;
    &__header {
        font-style: italic;
        text-align: left;
        height: 40px!important;
        display: flex;
        justify-content: space-between;
        align-items: center;
        & p {
            padding-top: 15px;
        }
    }
    &__body {
        margin: auto!important;
        margin: 0!important;
    }  
    &__btnDetails {
        margin-top: 0px!important;
        padding: 5px;
        height: 30px;
        font-size: 0.9em;
    }
}
    
.icon-only {
    display: none;
}

//Média query pour adapter la page au smartphone   
@media screen and (max-width : 768px) {  
    .icon-only {
        display: block;
        width: 25px!important;
        height: 25px!important;
    } 
    .icon-text {
        display: none;
    }
}

</style>