<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Task Title : {{ assignedTask.task_title }} </div>
   
      <div style="font-weight:bold" class='form-inp'>Assigned To : {{ assignedTask.user_username }} </div>
     
    <div class='form-inp'>Due Date : {{ assignedTask.deadline_date }} {{ assignedTask.deadline_time }}</div>

    <div class='ui bottom green solid button' v-on:click="markAsDone">
        Mark as Done
      </div>
    </div>

  </div>
   
 </div>

</template>

<script>

export default {
  name: 'AssignedTask',
  components: {
    
  }, 
  props: ['assignedTask'],
  methods: {
      markAsDone() {
        alert('unused');
      }
    }, 
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
    data () {
      return {
        state: 'pre-select'
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
