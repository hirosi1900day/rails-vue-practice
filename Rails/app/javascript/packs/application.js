
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("plugins/dayjs")

import Vue from 'vue'
import App from '../app.vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
Vue.use(Vuetify)
const vuetify = new Vuetify();
import router from '@/router'
import store from '@/store'

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        vuetify,
        router,
        store,
        created() {
            const userString = localStorage.getItem('currentUser')
            if (userString) {
                const userData = JSON.parse(userString)
                this.$store.commit('auth/SET_CURRENT_USER', userData)
            }
        },
        render: h => h(App)
    }).$mount()
    document.body.appendChild(app.$el)
})
