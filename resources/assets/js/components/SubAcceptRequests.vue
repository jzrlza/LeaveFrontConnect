<template>
 
 <div>
  <navbar></navbar>

  <sub-request-accept></sub-request-accept>
 </div>
  
</template>

<script>
import Navbar from './SubNavbar';
import SubRequestAccept from './SubRequestAccepter'

export default {
  name: 'SubProfile',
  components: {
    Navbar,
    SubRequestAccept
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
