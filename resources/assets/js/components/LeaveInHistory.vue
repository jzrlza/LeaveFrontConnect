<template>
 
 <div>

  
    <div class="form-control">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Type: {{ leave.type }} </div>
      </div>
    <div class='form-inp'>Details : {{ leave.details }}</div>
    <div style="font-weight:bold" class='form-inp'>Days period of leave : {{ leave.days_period_of_leave }}</div>
    <div style="font-weight:bold" class='form-inp'>Subordinate who request : {{ owner }}</div>
    <div class='form-inp' v-if='leave.sub_user_fullname != null'>Substitude subordinate : {{ sub_target }}</div>
    <div class='form-inp'>From task : {{ task }}</div>
    <div style="font-weight:bold" class='form-inp' v-if='leave.approved'>Approved : Yes</div>
    <div style="font-weight:bold" class='form-inp' v-if='!leave.approved'>Approved : No</div>


    

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
        owner: null,
        sub_target: null,
        task: null
      }
    },
    mounted(){
  var self = this;
      var the_id = self.leave.main_user_id;
      axios.get('req-owner',{
      params: {
        id: the_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.owner = res.data.name;
      });

      var sub_id = self.leave.sub_user_id;
      axios.get('req-owner',{
      params: {
        id: sub_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.sub_target = res.data.name;
      });

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
