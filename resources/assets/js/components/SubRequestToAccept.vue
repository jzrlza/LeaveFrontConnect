<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>From : {{ owner.name }}</div>
    <div style="font-weight:bold" class='form-inp'>Type: {{ leave.type }} </div>
      </div>
    <div class='form-inp'>Details : {{ leave.details }}</div>
    <div style="font-weight:bold" class='form-inp'>Days period of leave : {{ leave.days_period_of_leave }}</div>
    <div class='form-inp'>From task : {{ task.title }}</div>
    <div class='form-inp' v-if='leave.approved'>Approved : Yes</div>
    <div class='form-inp' v-if='!leave.approved'>Approved : No</div>
    <div class='ui bottom green solid button' v-on:click="acceptReq(leave)">
        Accept
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'accepted'">
      <div class='ui form'>
        <div style="font-weight:bold">The Request of {{ owner.name }} has been accepted. </div>
                
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
  props: ['leave'],
  methods: {
      acceptReq(leave) {
        var self = this;


   //   const stateUpdate = {
   //   'sub_user_approve': 1
   //     };

        var update_leave = {
          'id': leave.id,
          'sub_user_approve': 1
        };
        axios.post('accept_sub_req',update_leave)
        .then((res)=>{
          //console.log(res.data)
          return res;
        });


        this.state = 'accepted';
      },
      dismiss() {
        this.state = 'dismissed';
      }
    }, 
    data () {
      return {
        state: 'pre-select',
        owner: null,
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
        self.owner = res.data;
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
