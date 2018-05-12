<template>
 
 <div>
  <navbar></navbar>
  <profile-edit v-bind:profile="profile">
 </profile-edit>
  </div>
</template>

<script>
import Navbar from './SuperNavbar';
import ProfileEdit from './ProfileEditor';

export default {
  name: 'SuperProfile',
  components: {
    Navbar,
    ProfileEdit
  },
  data () {
    return {
      msg: 'SUPER USER PLACEHOLDER',
      profile: {
        username: 'super-user'
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
