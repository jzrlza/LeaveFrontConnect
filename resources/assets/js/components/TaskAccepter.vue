<template>
 
 <div>
<h2 class="form-inp-heading">Select Assigned Tasks</h2>
  <task  v-for="task in tasks" v-bind:task="task" :key="task"></task>

   <br>
 </div>

</template>

<script>
import Task from './TaskToAccept';
import axios from 'axios';

export default {
  name: 'Tasker',
  components: {
    Task
  }, 
  props: ['tasks'],
  methods: {
      assignTask () {
        alert('unused')
      }
    }, 
    data () {
      return {
        task_ids: [],
        tasks: []
        /*
        tasks: [
          {
          'title':'Get some money from the advertising.',
          'details':'Just get some money.',
          'deadline_date':'5/5/2019',
          'deadline_time':'08:00 AM'
          },
         {
          'title':'Do some exploration of the nearby jungle.',
            'details':'Get some of the snake venoms.',
           'deadline_date':'3/5/2019',
            'deadline_time':'10:00 PM'
         }

        ]*/
      }
    },
    mounted(){
    var self = this; 
    axios.get('unaccepted-tasks-get')
    .then((res)=>{
      console.log(res.data);
      self.task_ids = res.data;
    }).catch((error)=>{
      console.log(error);
    });

    axios.get('all-tasks-get')
    .then((res)=>{
      console.log(res.data);
      self.tasks = res.data;
    }).catch((error)=>{
      console.log(error);
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
