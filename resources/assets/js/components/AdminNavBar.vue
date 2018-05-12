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
    <a href="login">Logout</a>
  </li>

  <li class="dropdown">
    <a id="current_user">-username_admin-</a>
  </li>

</nav>
    <!--/.Navbar-->
  
</template>

<script>
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
      msg: 'ADMIN USER PLACEHOLDER'
    }
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
