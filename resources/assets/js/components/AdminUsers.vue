<template>
 <div>
  <admin-navbar v-bind:users="users"></admin-navbar>

  <user-manage></user-manage>
 </div>
  
</template>
<script>
import AdminNavbar from './AdminNavbar';
import UserManage from './UserManager';
import axios from 'axios';

export default {
  name: 'AdminUsers',
  components: {
    AdminNavbar,
    UserManage
  },
  data () {
    return {
      msg: 'ADMIN USER PLACEHOLDER',
      users: []
    }
  },
  mounted(){
        axios.get('admin-users').then(function (resp) { //I'm stuck!! resp.data is not array
                    console.log(resp.data);
                    this.users = resp.data.users; //ERROR
                })
                .catch(function (resp) {
                    console.log(resp);
                    alert("Could not load users");
                });
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  
</style>
