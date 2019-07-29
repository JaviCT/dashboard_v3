import Vue from 'vue'
import Router from 'vue-router'
import Home from './components/views/Home.vue'
import Camera from './components/views/Camera.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/camera/:id',
      name: 'camera',
      component: Camera
    }
  ]
})
