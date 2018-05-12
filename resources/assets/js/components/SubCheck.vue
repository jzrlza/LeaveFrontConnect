<template>
 
 <div>
  <navbar></navbar>

  <leave-history></leave-history>
 </div>
  
</template>

<script>
import Navbar from './SubNavbar';
import LeaveHistory from './LeaveHistorySub';

export default {
  name: 'SubProfile',
  components: {
    Navbar,
    LeaveHistory
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
</style>
