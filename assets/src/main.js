import Vue from 'vue'
import App from './App.vue'
import Login from './components/Login.vue'
import adminRouter from './components/adminRouter'
import router from './router'
import vuetify from './plugins/vuetify'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUser, faLock, faBars, faChevronRight, faVideo, faExpandArrowsAlt, faPencilAlt, faDownload, faPause, faPlay, faSearch } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(
  faUser,
  faLock,
  faBars,
  faChevronRight,
  faVideo,
  faExpandArrowsAlt,
  faPencilAlt,
  faDownload,
  faPause,
  faPlay,
  faSearch
)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {
  if(document.getElementById("login")){
    new Vue({
      adminRouter,
      vuetify,
      render: h => h(Login)
    }).$mount('#login')
  }

  if(document.getElementById("api-login")){
    new Vue({
      apiAdminRouter,
      vuetify,
      render: h => h(ApiLogin)
    }).$mount('#api-login')
  }

  if(document.getElementById("app")){
    const node = document.getElementById('app');
    const current_user = JSON.parse(node.getAttribute('current_user'));

    new Vue({
      router,
      render: h => h(App),
      vuetify,

      data: {
        user: current_user,
        users_access: [19,13959,116606]
      }
    }).$mount('#app')
  }
});
