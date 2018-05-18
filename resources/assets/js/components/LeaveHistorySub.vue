<template>
 
 <div>
<h2 class="form-inp-heading">Check Leave Approval</h2>
  <leave  v-for="leave in leaves" v-bind:leave="leave" :key="leave"></leave>
 </div>

</template>

<script>
import Leave from './LeaveInHistorySub';
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
      leaves:[]/*
        {
            'type':'Vacation',
            'details':'Need to take some days off, it is getting tiring',
            'days_period_of_leave': 20.0,
            'sub_user_fullname': 'Ryla Michal',
            'task_title': 'Mine some bitcoins.',
            'approved':true

        },
        {
            'type':'Personal Errand',
            'details':'I got to do build the combat pony before my cousin\'s home fortress is destroyed and robbed.',
            'days_period_of_leave': 3.14,
            'sub_user_fullname': null,
            'task_title': 'Make a security platform for our company about top secret files.',
            'approved':false

        }

      ]*/
      }
    },
    mounted(){
    var self = this;
    axios.get('reqs-get')
    .then((res)=>{
      self.leaves = res.data;
    });
    
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
