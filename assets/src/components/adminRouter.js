import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

import Login from "./Login.vue"

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: "/", component: Login, name: "login", meta: { title: "Admin - Login"}}
  ]
});

router.beforeEach((to, from, next) => {
  document.title = to.meta.title
  next()
});

export default router;
