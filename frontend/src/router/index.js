//CONFIGURATION DU ROUTER VUE

import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Gifs from '../views/Gifs.vue'
import Articles from '../views/Articles.vue'
import CommentForm from '../views/CommentForm.vue'
import ArticleDetails from '../views/ArticleDetails.vue'
import CommentDetails from '../views/CommentDetails.vue'
import PostArticle from '../views/PostArticle.vue'
import Login from '../views/Login.vue'
import Signup from '../views/Signup.vue'

Vue.use(VueRouter)

const routes = [
    {
        path: '/auth/login',
        name: 'login',
        component: Login
    },
   {
        path: '/auth/signup',
        name: 'signup',
        component: Signup
    },
    {
        path: '/',
        name: 'home',
        component: Home
    },
    {
        path: '/gifs',
        name: 'gifs',
        component: Gifs
    },
    {
        path: '/articles/add',
        name: 'post-article',
        component: PostArticle
    },
    {
        path: '/articles',
        name: 'articles-list',
        component: Articles
    },
    {
        path: '/articles/:slug',
        name: 'one-article-details',
        component: ArticleDetails
    },
    {
        path: '/articles/:slug/comments',
        name: 'comments-list',
        component: CommentForm
    },
    {
        path: '/articles/:slug/comments/:cryptoslug',
        name: 'one-comment-details',
        component: CommentDetails
    }   
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

