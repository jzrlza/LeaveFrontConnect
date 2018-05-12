<template>
 <div>
  <navbar></navbar>

  <leave-approve></leave-approve>
  
</div>
</template>

<script>
import Navbar from './SuperNavbar'
import LeaveApprove from './LeaveApprover'

export default {
  name: 'SuperProfile',
  components: {
    Navbar,
    LeaveApprove
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
