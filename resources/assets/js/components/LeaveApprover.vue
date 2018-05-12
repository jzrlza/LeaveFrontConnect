<template>
 
 <div>
<h2 class="form-inp-heading">Approve Leave Requests</h2>
  <leave  v-for="leave in leaves" v-bind:leave="leave" :key="leave"></leave>
   <br>
 </div>

</template>

<script>
import Leave from './LeaveToApprove';

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
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
    data () {
      return {
      leaves:[
        {
            'type':'Vacation',
            'details':'Need to take some days off, it is getting tiring',
            'days_period_of_leave': 20.0,
            'user_fullname': 'Agenda Timothy',
            'sub_user_fullname': 'Ryla Michal',
            'task_title': 'Mine some bitcoins.'

        },
        {
            'type':'Personal Errand',
            'details':'I got some post delivery that is urgently required for my parent\'s life',
            'days_period_of_leave': 4.0,
            'user_fullname': 'Fisha Microra',
            'sub_user_fullname': null,
            'task_title': 'Make a security platform for our company about top secret files.'

        },
        {
            'type':'Sick',
            'details':'I got some flus from doing dumpster diving, I shouldn\'t have done that!',
            'days_period_of_leave': 5.5,
            'user_fullname': 'Bobby Willhace',
            'sub_user_fullname': 'Alison Coverclove',
            'task_title': 'Invent a machine in the office that will work for the product for horses\' health.'

        }

      ]
      }
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
