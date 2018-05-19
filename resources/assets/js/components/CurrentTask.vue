<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Task Title : {{ assignedTask.title }} </div>
   
      <div style="font-weight:bold" class='form-inp'>Assigned To : {{ assignee }} </div>
     
    <div class='form-inp'>Due Date : {{ assignedTask.deadline }}</div>

    <div class='ui bottom green solid button' v-on:click="markAsDone">
        Mark as Done
      </div>
    </div>

  </div>

  <div class="form-control" v-show="this.state == 'is-done'">
      Task {{ assignedTask.title }} is now considered Done.
  </div>
   
 </div>

</template>

<script>
import axios from 'axios';

export default {
  name: 'AssignedTask',
  components: {
    
  }, 
  props: ['assignedTask'],
  methods: {
      markAsDone() {
        this.state = 'is-done';
      }
    }, 
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
    data () {
      return {
        state: 'pre-select',
        assignee: null
      }
    },
    mounted(){
      var self = this;
      var user_id = self.assignedTask.user_id;
      axios.get('req-owner',{
      params: {
        id: user_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.assignee = res.data.name;
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
