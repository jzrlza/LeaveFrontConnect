<template>
 
 <div>
  <navbar></navbar>
  <profile-edit v-bind:profile="profile">
 </profile-edit>
  </div>
</template>

<script>
import axios from 'axios';
  
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
      profile: null,
      current_id: 0
    }
  },
  mounted(){
    this.current_id = 2; //Placeholder, get the current logged on user's id

    var self = this; 
    var the_id = this.current_id;
    axios.get('req-owner',{
      params: {
        id: the_id
        }
      })
    .then((res)=>{
      console.log(res.data);
      self.profile = res.data;

    });
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
