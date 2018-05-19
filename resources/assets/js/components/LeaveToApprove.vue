<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Type: {{ leave.type }} </div>
      </div>
    <div class='form-inp'>Details : {{ leave.details }}</div>
    <div style="font-weight:bold" class='form-inp'>Days period of leave : {{ leave.days_period_of_leave }}</div>
    <div style="font-weight:bold" class='form-inp'>Subordinate who request : {{ owner.name }}</div>
    <div class='form-inp' v-if='leave.sub_user_id != null'>Substitude subordinate : {{ sub_target.name }}</div>
    <div class='form-inp'>From task : {{ task.title }}</div>

    <div class='ui bottom green solid button' v-on:click="approve(leave)">
        Approve
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'approved'">
      <div class='ui form'>
        <div style="font-weight:bold">The {{ leave.type }} Leave of {{ owner.name }} has been approved. </div>
                
          <button class='ui bottom green basic button' v-on:click="dismiss">
            Dismiss
          </button>
        
      </div>
    </div>

    <div v-show="this.state == 'dismissed'">
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
  props: ['leave','owner'],
  methods: {
      approve(leave) {
        var self = this;


      //const super_n_sub = {
      //'sub_user_approve': 1
      //  };

        //var main_id = owner.id;
        axios.put('approve_leave_req',leave)//{
        //params: {
        //  main_user_id: main_id
        //  }
        //})
        
        .then((res)=>{
          //console.log(res.data)
          return res;
        });


        this.state = 'approved';
      },
      dismiss() {
        this.state = 'dismissed';
      }
    }, 
    data () {
      return {
        state: 'pre-select',
        owner: null,
        sub_target: null,
        task: null,
      }
    },
    mounted(){
      //Match the current logon Supervisor later
      var self = this;
      var the_id = self.leave.main_user_id;
      axios.get('req-owner',{
      params: {
        id: the_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.owner = res.data;
      });

      var sub_id = self.leave.sub_user_id;
      axios.get('req-owner',{
      params: {
        id: sub_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.sub_target = res.data;
      });

      var task_id = self.leave.involved_task_id;
      axios.get('specific-task',{
      params: {
        id: task_id
        }
      })
      .then((res)=>{
        //console.log(res.data)
        self.task = res.data;
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
