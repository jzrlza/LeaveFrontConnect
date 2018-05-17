<template>
 <div>
  <admin-navbar></admin-navbar>

  <user-manage></user-manage>
 </div>
  
</template>
<script>
import AdminNavbar from './AdminNavbar';
import UserManage from './UserManager';


export default {
  name: 'AdminUsers',
  components: {
    AdminNavbar,
    UserManage
  },
  props: ['users'],
  data: function () {
    return {
      msg: 'ADMIN USER PLACEHOLDER',
      users: [],
    }
  },
  
  
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  
</style>
