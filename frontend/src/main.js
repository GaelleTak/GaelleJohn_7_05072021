//CONFIGURATION GENERALE DE LA LA SINGLE PAGE APPLICATION AVEC VUE

import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

//Configuration de Vee-Validate pour la validation des inputs du login et du signup
import { ValidationProvider, extend } from "vee-validate"
import { required, email } from "vee-validate/dist/rules"
import { ValidationObserver } from "vee-validate"

extend("required", {
    ...required,
    message: "Ce champ est obligatoire"
})
extend("email", {
    ...email,
    message: "Cet email n'est pas valide"
})
extend('minmax', {
    validate(value, { min, max }) {
        return value.length >= min && value.length <= max;
    },
    params: ['min', 'max'],
    message: "Ce champ a trop ou pas assez de caractères"
})
// Fin configuration Vee-validate

Vue.use(BootstrapVue)
Vue.use(Vuex)
Vue.component('ValidationProvider', ValidationProvider)
Vue.component('ValidationProvider', ValidationObserver)

Vue.config.productionTip = false

//Configuration du store de Vuex pour permettre l'assignation des rôles (user/admin) et les autorisations sur les différentes requêtes
const store = new Vuex.Store({
    plugins: [createPersistedState()],
    state: {
        userId: null,
        token: null,
        isAdmin: null
    },
    mutations: {
        setUserId(state, userId) {
            state.userId = userId;
        },
        setToken(state, token) {
            state.token = token;
        },
        setIsAdmin(state, isAdmin) {
            state.isAdmin = isAdmin;
        }, 
        logout(state) {
            state.userId = null;
            state.isAdmin = null;
            state.token = null;
        }
    },
    actions: {},
    getters: {
        isLoggedIn(state) {
            return !!state.token;
        },
        isUserAdmin(state) {
            if(state.isAdmin == 1) {
                return true;
            }
        }
    }
})
//Fin configuration Vuex


new Vue({
    router,
    store: store,
    render: h => h(App)
}).$mount('#app')

