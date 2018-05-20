<template>
 
    <!--Navbar-->
    <nav placement="top" type="default" class="the-nav">
  <!-- Brand as slot -->
  <a slot="brand" href="super-profile" title="Home" class="navbar-brand">LeaveU - Leave Request System [Supervisor]</a>
  <!-- You can use dropdown component -->
  
  <li class="dropdown">
    <a href="super-profile">Edit Profile</a>
  </li>
    
  <li class="dropdown">
    <a href="super-assign-tasks">Assign Tasks</a>
  </li>

  <li class="dropdown">
    <a href="super-approve-leaves">Approve Leaves</a>
  </li>

  <li class="dropdown">
    <a href="super-check">Check</a>
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
  name: 'SuperProfile',
  components: {
    Navbar,
    NavbarItem,
    NavbarItemDropdown,
    NavbarNav,
    NavbarCollapse
  },
  data () {
    return {
      username: null,
      current_id: 0
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

    this.current_id = 2; //Placeholder, get the current logged on user's id

    var the_id = this.current_id;
    axios.get('req-owner',{
      params: {
        id: the_id
        }
      })
    .then((res)=>{
      console.log(res.data);
      self.username = res.data.name;

    });
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
