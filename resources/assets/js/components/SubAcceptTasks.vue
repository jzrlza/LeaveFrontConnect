<template>

 <div>
  <navbar></navbar>
  <task-accept></task-accept>
 </div>
  
</template>

<script>
import Navbar from './SubNavbar';
import TaskAccept from './TaskAccepter';

export default {
  name: 'SubProfile',
  components: {
    Navbar,
    TaskAccept
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
