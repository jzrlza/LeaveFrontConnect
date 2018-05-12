<template>
 
    <!--Navbar-->
    <nav placement="top" type="default" class="the-nav">
  <!-- Brand as slot -->
  <a slot="brand" href="sub-profile" title="Home" class="navbar-brand">LeaveU - Leave Request System [Subordinate]</a>
  <!-- You can use dropdown component -->
  
  <li class="dropdown">
    <a href="sub-profile">Edit Profile</a>
  </li>

  <li class="dropdown">
    <a href="sub-accept-tasks">Accept Tasks</a>
  </li>

  <li class="dropdown">
    <a href="sub-accept-requests">Accept Substitude Requests</a>
  </li>

  <li class="dropdown">
    <a href="sub-check">Check</a>
  </li>

  <li class="dropdown">
    <a href="login">Logout</a>
  </li>

  <li class="dropdown">
    <a id="current_user">-username_sub-</a>
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
  name: 'SubProfile',
  components: {
    Navbar,
    NavbarItem,
    NavbarItemDropdown,
    NavbarNav,
    NavbarCollapse
  },
  data () {
    return {
      msg: 'SUB USER PLACEHOLDER'
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
