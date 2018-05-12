<template>
 
 <div>
<h2 class="form-inp-heading">Select Assigned Tasks</h2>
  <task  v-for="task in tasks" v-bind:task="task" :key="task"></task>

<!--
  
  <div v-for="a_task in tasks" :key="a_task">
    <div class="form-control" v-show="!isEditing">
    <div class='header'>{{ a_task.title }} </div>
    <div class='meta'>Due Date : {{ a_task.deadline_date }} {{ a_task.deadline_time }}</div>

    <div class='ui bottom attached red basic button' v-on:click="showAcceptForm">
        Accept Task
      </div>
    </div>

    <div class="form-control" v-show="isEditing">
      <div class='ui form'>
        <div class='field'>
          <label>Title</label>
          <input type='text' >
        </div>
        <div class='field'>
          <label>Project</label>
          <input type='text' >
        </div>
        <div class='ui two button attached buttons'>
          <button class='ui basic green solid button' v-on:click="hideForm"> Change this for backend
            Accept
          </button>
        </div>
      </div>
    </div>

  </div>
   -->

   <br>
 </div>

</template>

<script>
import Task from './TaskToAccept';

export default {
  name: 'Tasker',
  components: {
    Task
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
