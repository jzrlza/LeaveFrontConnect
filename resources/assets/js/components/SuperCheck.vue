<template>
 
 <div>
  <navbar></navbar>

  <current-task-check></current-task-check>
  <leave-history></leave-history>
 </div>
  
</template>

<script>
import Navbar from './SuperNavbar';
import CurrentTaskCheck from './CurrentTaskChecker';
import LeaveHistory from './LeaveHistory';

export default {
  name: 'SuperProfile',
  components: {
    Navbar,
    CurrentTaskCheck,
    LeaveHistory
  },
  data () {
    return {
      msg: 'SUPER USER PLACEHOLDER'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
