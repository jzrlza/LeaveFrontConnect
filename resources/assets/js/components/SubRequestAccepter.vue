<template>
 
 <div>
<h2 class="form-inp-heading">Accept Substitution Requests</h2>
  <sub-request  v-for="leave in leaves" v-bind:leave="leave" :key="leave"></sub-request>
   <br>
 </div>

</template>

<script>
import SubRequest from './SubRequestToAccept';

export default {
  name: 'Leaveer',
  components: {
    SubRequest
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
            'type':'Personal Errand',
            'details':'I got some post delivery that is urgently required for my parent\'s life',
            'days_period_of_leave': 4.0,
            'user_fullname': 'Fisha Microra',
            'task_title': 'Make a security platform for our company about top secret files.',
            'approved': true
        },
        {
            'type':'Vacation',
            'details':'I am going to be off to the far continent for 1 year!',
            'days_period_of_leave': 365.25,
            'user_fullname': 'Bobby Willhace',
            'task_title': 'Mine some diamonds from the Frisby Cave.',
            'approved': false

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
