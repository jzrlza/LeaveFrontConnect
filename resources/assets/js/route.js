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

Vue.use(Router)

export default new Router({
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
})