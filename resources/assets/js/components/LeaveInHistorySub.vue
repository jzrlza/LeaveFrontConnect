<template>
 
 <div>

  
    <div class="form-control">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Type: {{ leave.type }} </div>
      </div>
    <div class='form-inp'>Details : {{ leave.details }}</div>
    <div style="font-weight:bold" class='form-inp'>Days period of leave : {{ leave.days_period_of_leave }}</div>
    <div class='form-inp' v-if='leave.sub_user_fullname != null'>Substitude subordinate : {{ leave.sub_user_id }}</div>
    <div class='form-inp'>From task : {{ task }}</div>
    <div class='ui two buttons'>
    <button class='ui bottom attached green basic button' v-if='leave.approved'><i class='smile icon'></i>Approved</button>
    <button class='ui bottom attached grey basic button' v-if='!leave.approved'>Not Yet Approved</button>
  </div>
    

  </div>
   
 </div>

</template>

<script>
import axios from 'axios';

export default {
  name: 'Leave',
  components: {
    
  }, 
  props: ['leave'], 
    data () {
      return {
        state: 'pre-select',
        task: null
      }
    },
    mounted(){
      var self = this;
      var task_id = self.leave.involved_task_id;
      axios.get('specific-task',{
      params: {
        id: task_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.task = res.data.title;
      });
    }
  
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.form-inp, .form-inp-heading{
  text-align: left;
  max-width: 1000px;
  margin: 200 auto;
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
