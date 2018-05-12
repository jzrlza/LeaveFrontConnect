<template>
 
 <container>
  <navbar></navbar>

  <profile-edit v-bind:profile="profile">
 </profile-edit>
 </container>
  
</template>

<script>
import Navbar from './SubNavbar';
import ProfileEdit from './ProfileEditor';

export default {
  name: 'SubProfile',
  components: {
    Navbar,
    ProfileEdit
  },
  data () {
    return {
      msg: 'SUB USER PLACEHOLDER',
      profile: {
        username: 'sub-user'
      }
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
    color: green;
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
  color: #42b983;
}
.navbar-item {
  color: #42b983;
}
#current {
  color: grey;
}
</style>
