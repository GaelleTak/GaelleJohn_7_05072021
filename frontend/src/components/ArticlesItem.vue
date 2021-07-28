<!--COMPONENT CORRESPONDANT A L'AFFICHAGE D'UN ARTICLE (UTILISE DANS LES PAGES ARTICLES.VUE ET ARTICLEDETAILS.VUE)-->

<template>
    <div>
        <!--Section qui s'affiche si la page qui appelle ce component est celle qui affiche la liste complète des articles-->
        <div v-if="this.$route.name == 'articles-list'" class="card text-center">
            <div class="card-body card__body">
                <h3 class="card-title card__title">{{ title }}</h3>
                <p class="card-subtitle card__subtitle">{{ subject }}</p>
                <p class="card__date">Article posté le : {{ new Date(date_post).toLocaleDateString('fr-CA') }} par {{ username }}</p>
            </div>
            <a class="btn btn-secondary card__btnDetails" :href="'/articles/' + slug"><i class="fas fa-info-circle"></i> En savoir plus</a>
        </div>
        <!--Section qui s'affiche si la page qui appelle ce component est celle qui affiche un article en particulier-->
        <div v-else class="card text-center">
            <div class="card-header card__header">
                <ul class="list-group">
                    <li class="list-group-item card__comments">
                        <a href="#commentsList"><i class="far fa-eye"></i> Voir tous les commentaires</a>
                        <a :href="'/articles/' + slug + '/comments'"><i class="far fa-edit"></i> Poster un commentaire</a>
                    </li>
                    <li class="list-group-item">
                        <!--La section suivante ne s'affiche que si le user a liké ou disliké l'article-->
                        <div v-if="liked || disliked" >
                            <!--La section suivante ne s'affiche que si le user a liké l'article : donc le pouce du like est rouge et celui du dislike est grisé-->
                            <div v-if="liked">
                                <span class="card__stats">{{ totalLikes }} </span><span @click="deleteThumb" class="thumbs thumbs__up thumbs__red"><i class="far fa-thumbs-up thumbs"></i></span>
                                <span class="thumbs__down thumbs disabled"><i class="far fa-thumbs-down thumbs"></i></span><span class="card__stats"> {{ totalDislikes }}</span>
                            </div>
                            <!--La section suivante ne s'affiche que si le user a disliké l'article : : donc le pouce du dislike est rouge et celui du like est grisé-->
                            <div v-else>
                                <span class="card__stats">{{ totalLikes }} </span><span class="thumbs thumbs__up disabled"><i class="far fa-thumbs-up thumbs"></i></span>
                                <span @click="deleteThumb" class="thumbs thumbs__down thumbs__red"><i class="far fa-thumbs-down thumbs"></i></span><span class="card__stats"> {{ totalDislikes }}</span>
                            </div>
                        </div>
                        <!--La section suivante s'affiche si le user n'a pas encore liké ou disliké l'article-->
                        <div v-else>
                            <div>
                                <span class="card__stats">{{ totalLikes }} </span><span @click="sendLike" class="thumbs thumbs__up"><i class="far fa-thumbs-up thumbs"></i></span>
                                <span @click="sendDislike" class="thumbs thumbs__down"><i class="far fa-thumbs-down thumbs"></i></span><span class="card__stats"> {{ totalDislikes }}</span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="card-body card__body ">
                <h2 class="card-title card__title">{{ title }}</h2>
                <p class="card-subtitle card__subtitle">{{ subject }}</p>
                <p class="card__date">Article posté le : {{ new Date(date_post).toLocaleDateString('fr-CA') }} par {{ username }}</p>
                <p class="card-text card__description">{{ description }}</p>
            </div>
            <div v-if="presenceOfLinks === true" card__links >
                <a :href="lien_web" target="_blank" class="btn btn-primary card__btnWeb" aria-label="Lien vers le site web">Lien vers l'article</a>
                <iframe :src="lien_web" width="300px" height="200px" title="Aperçu du site web" aria-label="Aperçu du site web" sandbox class="card__iframe"></iframe>
            </div>
            <div v-else card__links >
            </div>
        </div>
    </div>
</template>


<script>

export default {
	name: "ArticlesItem",
	props: {
        id: {
            type: Number,
            required: true
        },
		title: {
			type: String,
			required: true
		},
        slug: {
			type: String,
			required: true
		},
        description: {
			type: String,
			required: true
		},
        subject: {
			type: String,
			required: true
		},
        lien_web: {
			type: String,
		},
		username: {
			type: String,
			required: true
		},
		date_post: {
			type: String,
			required: true
		},
        presenceOfLinks: {
            type: Boolean,
            required: true
        },
        sendLike: {
			type: Function,
			required: true
		},
        sendDislike: {
			type: Function,
			required: true
		},
        deleteThumb: {
			type: Function,
			required: true
		},
        liked: {
			type: Boolean,
			required: true
		},
        disliked: {
			type: Boolean,
			required: true
		},
        totalLikes: {
			type: Number,
			required: true
		},
        totalDislikes: {
			type: Number,
			required: true
		}  
	},
    methods: {
        logout() {
            this.$store.commit("logout");
            this.$router.push({ path: "/" });
        }
    }
}
</script>


<style scoped lang="scss">
  
$color-primary: #cc2810;
$color-secondary: #324392;
$color-bkg: #f1f1f2;
    
.card {
    border: 2px solid $color-secondary!important;
    padding: 0 0 30px 0!important;
    margin: auto;
    width: 100%!important;
    margin-bottom: 20px;
    border-radius: 10px!important;
    &__header {
        color: $color-secondary;
        font-style: italic;
        text-align: right;
        padding: 0px;
        & a {
            margin: 0px!important;
            color: $color-secondary!important;
            &:hover {
               text-decoration: none;
               color: black!important; 
            }
        }
        & li {
            height: 40px!important;
            background: $color-bkg;
        }
    }
    &__comments {
        border-radius: 8px 8px 0 0!important;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    &__btnDetails {
        margin-top: 0px!important;
    }
    &__body {
        margin: auto!important;
        padding-bottom: 0px!important;
        width: 80%!important;
    }
    &__title {
        color: rgb(113, 113, 170);
        margin-bottom: 10px!important;
    }
    &__subtitle {
        font-style: italic;
        font-weight: bold;
    }
    &__description {
        text-align: justify;
    }
    &__links iframe, a {
        display: block;
        margin: auto;
    }
    &__btnWeb {
        margin-top: 10px!important;
        max-width: 30%;
    }
}

.thumbs {
    font-size: 1.2em!important;
    margin-bottom: 10px!important;
    &__up {
        margin-right: 10px;
    }
    &__up:hover, &__down:hover {
        color: $color-primary;
    }
    &__red {
       color: $color-primary;
        font-size: 1.3em!important;
    }
}
    
.disabled {
    color: lighten($color-secondary, 40%);
    &:hover {
        color: lighten($color-secondary, 40%);
    }
}
 
    
//Média query pour adapter la page au smartphone
@media screen and (max-width : 768px) {  
    .card {
        &__btnDetails {
            height: 40px!important;
        }
        &__comments {
            font-size: 0.7em;
            min-height: 50px!important;
            text-align: center;
        }
    
    }
}

</style>