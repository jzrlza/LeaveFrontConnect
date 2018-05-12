<template>
 <div>
  <navbar></navbar>
  <task-assign v-bind:task="task"></task-assign>
 </div>
  
</template>

<script>
import Navbar from './SuperNavbar'
import TaskAssign from './TaskAssigner'

export default {
  name: 'SuperProfile',
  components: {
    Navbar,
    TaskAssign
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
