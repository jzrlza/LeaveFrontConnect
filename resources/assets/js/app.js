
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
import Vue from 'vue'
import Router from 'vue-router'
import Login from './components/Login'
import HelloWorld from './components/HelloWorld'
import AdminUsers from './components/AdminUsers'
import AdminPrintReport from './components/AdminPrintReport'
import SuperProfile from './components/SuperProfile'
import SuperAssignTasks from './components/SuperAssignTasks'
import SuperApproveLeaves from './components/SuperApproveLeaves'
import SuperCheck from './components/SuperCheck'
import SubProfile from './components/SubProfile'
import SubAcceptTasks from './components/SubAcceptTasks'
import SubAcceptRequests from './components/SubAcceptRequests'
import SubCheck from './components/SubCheck'
//require('./bootstrap');
import axios from 'axios'
import VueRouteLaravel from 'vue-route-laravel'
Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/home',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/admin-users',
      name: 'AdminUsers',
      component: AdminUsers
    },
    {
      path: '/admin-print-report',
      name: 'AdminPrintReport',
      component: AdminPrintReport
    },
    {
      path: '/super-profile',
      name: 'SuperProfile',
      component: SuperProfile
    },
    {
      path: '/super-assign-tasks',
      name: 'SuperAssignTasks',
      component: SuperAssignTasks
    },
    {
      path: '/super-approve-leaves',
      name: 'SuperApproveLeaves',
      component: SuperApproveLeaves
    },
    {
      path: '/super-check',
      name: 'SuperCheck',
      component: SuperCheck
    },
    {
      path: '/sub-profile',
      name: 'SubProfile',
      component: SubProfile
    },
    {
      path: '/sub-accept-tasks',
      name: 'SubAcceptTasks',
      component: SubAcceptTasks
    },
    {
      path: '/sub-accept-requests',
      name: 'SubAcceptRequests',
      component: SubAcceptRequests
    },
    {
      path: '/sub-check',
      name: 'SubCheck',
      component: SubCheck
    }
  ]
});


const queryString = require('query-string')
//window.Vue = require('vue');
//window.VueRouter = require('vue-router');
var config = {
    baseroute: '/api/route/',
    axios: axios,
    queryString: queryString,
    csrf_token: document.head.querySelector("[name=csrf-token]").content
}
Vue.use(VueRouteLaravel, config)

//Vue.use(VueRouter);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

//Vue.component('example-component', require('./components/ExampleComponent.vue'));
Vue.component('login-page',require('./components/Login.vue'));
Vue.component('admin-users', require('./components/AdminUsers.vue'));
Vue.component('admin-print-report', require('./components/AdminPrintReport.vue'));
Vue.component('super-profile', require('./components/SuperProfile.vue'));
Vue.component('super-assign-tasks', require('./components/SuperAssignTasks.vue'));
Vue.component('super-approve-leaves', require('./components/SuperApproveLeaves.vue'));
Vue.component('super-check', require('./components/SuperCheck.vue'));
Vue.component('sub-profile', require('./components/SubProfile.vue'));
Vue.component('sub-accept-tasks', require('./components/SubAcceptTasks.vue'));
Vue.component('sub-accept-requests', require('./components/SubAcceptRequests.vue'));
Vue.component('sub-check', require('./components/SubCheck.vue'));

Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue')
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue')
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue')
);

const app = new Vue({
	router,
    el: '#app'
});
