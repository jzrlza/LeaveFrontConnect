<template>
 
 <div>
<h2 class="form-inp-heading">Approve Leave Requests</h2>
  <leave  v-for="leave in leaves" v-bind:leave="leave" :key="leave"></leave>
   <br>
 </div>

</template>

<script>
import Leave from './LeaveToApprove';
import axios from 'axios';

export default {
  name: 'Leaveer',
  components: {
    Leave
  }, 
  props: ['leaver'],
  methods: {
      assignTask () {
        alert('unused')
      }
    }, 
    data () {
      return {
        leaves:[],
      }
    },
    mounted(){
    var self = this;
    axios.get('unapproved-reqs-get')
    .then((res)=>{
      self.leaves = res.data;
    });
    /*
    axios.get('users-all')
    .then((res)=>{
      self.users = res.data;
    });
    */
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.form-inp, .form-inp-heading{
  text-align: left;
  max-width: 500px;
  margin: 255 auto;
}
.txtinp {
  color: #555;
}
.form-inp .form-inp-heading,
.form-inp .checkbox {
  margin-bottom: 10px;
}
.form-inp .checkbox {
  font-weight: normal;
}
.form-inp .form-control:focus {
  z-index: 2;
}
.form-inp .form-control {
  margin-bottom: 8px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
</style>
