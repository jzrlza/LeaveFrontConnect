<template>
 
    <!--Navbar-->
    <nav placement="top" type="default" class="the-nav">
  <!-- Brand as slot -->
  <a slot="brand" href="admin-users" title="Home" class="navbar-brand">LeaveU - Leave Request System [Administrator]</a>
  <!-- You can use dropdown component -->
  
  <li class="dropdown">
    <a href="admin-users">Manage Users</a>
  </li>
 
  <!-- Or normal bootstrap style -->
  <li class="dropdown">
    <a href="admin-print-report">Print Statistic Report</a>
  </li>

  <li class="dropdown">
    <a href="login" v-on:click='logout'>Logout</a>
  </li>

  <li class="dropdown">
    <a id="current_user">-{{ username }}-</a>
  </li>

</nav>
    <!--/.Navbar-->
  
</template>

<script>
import axios from 'axios';

import Navbar from './Navbar'
import NavbarItem from './NavbarItem'
import NavbarItemDropdown from './NavbarItemDropdown'
import NavbarNav from './NavbarNav'
import NavbarCollapse from './NavbarCollapse'

export default {
  name: 'AdminUsers',
  components: {
    Navbar,
    NavbarItem,
    NavbarItemDropdown,
    NavbarNav,
    NavbarCollapse
  },
  data () {
    return {
      username: null
    }
  },
  methods: {
    logout(){
      alert('Goodbye.');

      //Unauthorization

      window.location = 'login';
    }
  },
  mounted(){
      var self = this;

    axios.get('oauth/clients')
    .then(response => {
        console.log(response.data);
    });

    this.username = 'Jzrlza'; 
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .navbar .dropdown-menu a:hover {
    color: red !important;
  }
  .navbar-brand:hover{
    color: white;
  }
  .the-nav {
    background-color: teal;
  }
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  color: #42b983;
  display: inline-block;
  margin: 0 10px;
}
a, router-link , .navbar-brand{
  color: #d5ff78;
}
.navbar-item {
  color: #d5ff78;
}
#current_user {
  color: white;
}
</style>
