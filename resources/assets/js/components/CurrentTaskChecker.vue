<template>
 
 <div>
<h2 class="form-inp-heading">Check Current Tasks</h2>
  <assigned-task  v-for="assignedTask in assignedTasks" v-bind:assignedTask="assignedTask" :key="assignedTask"></assigned-task>

   <br>
 </div>

</template>

<script>
import AssignedTask from './CurrentTask';

export default {
  name: 'Tasker',
  components: {
    AssignedTask
  }, 
  props: ['tasker'],
  methods: {
      assignTask () {
        alert('unused')
      }
    }, 
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
    data () {
      return {
        assignedTasks: [
          {
          'task_title':'Get some money from the advertising.',
          'user_username':'sub1',
          'deadline_date':'5/5/2019',
          'deadline_time':'08:00 AM'
          },
         {
          'task_title':'Get some money from the advertising.',
          'user_username':'sub2',
          'deadline_date':'5/5/2019',
          'deadline_time':'08:00 AM'
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
  max-width: 1000px;
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
