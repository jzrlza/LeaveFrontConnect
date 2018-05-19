<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>{{ task.title }} </div>
      </div>
    <div class='form-inp'>Details : {{ task.detail }}</div>
    <div class='form-inp'>Due Date : {{ task.deadline }}</div>

    <div class='ui bottom red solid button' v-on:click="showAcceptForm">
        Accept Task
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'accept-form'">
      <div style="font-weight:bold" class='form-inp'>{{ task.title }} </div>
      <div style="font: italic 15px arial, sans-serif; padding-left:5mm;" class='form-inp'> {{ task.details }} </div>
      <br>
      <div class='ui form'>
        <div class='field'>
          <label class="form-inp">Priority</label>
          <select name="priority" v-model='priority'>
          <option value="low">Low</option>
          <option value="mid">Medium</option>
          <option value="hi">High</option>
          </select>
        </div>
        <div class='field'>
          <label class="form-inp">Expected Complete Date</label>
          <input type="date" v-model='exp_date' required>
        </div>
        <div class='field'>
          <label class="form-inp">Expected Complete Time</label>
          <input type="time" v-model='exp_time' required>
        </div>
        <div class='ui two button attached buttons'>
          <button class='ui bottom attached green solid button' v-on:click="askAboutLeave">
            Accept
          </button>
        </div>
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'ask'">
      <div class='ui form'>
      <label style="font-weight:bold;" class='form-inp'>Ask Permission To Leave?</label>
      <div class='ui two button attached buttons'>
      <button class='ui bottom attached green solid button' v-on:click="showLeaveForm">
            Yes
          </button>
          <button class='ui bottom attached red solid button' v-on:click="submit">
            No
          </button>
        </div>
        </div>
    </div>

    <div class="form-control" v-show="this.state == 'leave-form'">
     <div style="font-weight:bold" class='form-inp'>Leave Request</div>
     <br>
     <div class='ui form'>
        <div class='field'>
          <label class="form-inp">Leave Type</label>
          <select name="leave-type" v-model='type'>
          <option value="Vacation">Vacation</option>
          <option value="Personal_Errand">Personal Errand</option>
          <option value="Sick">Sick</option>
          </select>
        </div>
        <div class='field'>
          <label class="form-inp">Details</label>
          <input v-model='details'>
        </div>
        <div class='field'>
          <label class="form-inp">Days Period Of Leave</label>
          <input type="number" v-model='days_period_of_leave'>
        </div>
        <div class='field'>
          <label class="form-inp">Pick Substitude</label>
          <select name="substitude" v-model='sub_user_id'>
          <option :value=null>-None-</option>
          <option v-for="user in other_subs" :value="user.id">
            {{ user.name }}</option>
          </select>
        </div>
        <br>
      </div>
     <div class='ui two button attached buttons'>
          <button class='ui bottom attached green solid button' v-on:click="submit(task)">
            Submit
          </button>
        </div>
    </div>

    <div class="form-control" v-show="this.state == 'accepted'">
        Task {{ task.title }} Accepted.
    </div>

  </div>
   


</template>

<script>
import axios from 'axios';

export default {
  name: 'Task',
  data: {//LOCAL DATA BINDIND
    priority: '',
    exp_date: '',
    exp_time: '',
    type: '',
    details: '',
    days_period_of_leave: '',
    sub_user_id: '',
    current_id: ''
  },
  components: {
    
  }, 
  props: ['task'],
  methods: {
      showAcceptForm() {
        this.state = 'accept-form';
      },
       askAboutLeave() {
        this.state = 'ask';
      },
       showLeaveForm() {
        this.state = 'leave-form';
      },
       submit(task) {
        var self = this;


        var update_task = {
          'priority': this.priority,
          'exp_date' : this.exp_date+" "+this.exp_time+":00"
        };
        //axios.put(url, content, config)
        axios.put('accept-task',update_task, task)
        .then((res)=>{
          //console.log(res.data)
          return res;
        });

        var leave_req = {
          'type': this.type,
          'details' : this.details,
          'days_period_of_leave' : this.days_period_of_leave,
          'sub_user_id' : this.sub_user_id,
          'involved_task_id': task.task_id,
          'main_user_id': this.current_id //PlaceHolder
        };


        axios.post('submit-leave-req', leave_req)
            .then(res => {
       console.log(res);
                return res;
          });

        this.state = 'accepted'; 
      },
    }, 
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
    data () {
      return {
        state: 'pre-select',
        other_subs : []
      }
    },
    mounted(){
      this.current_id = 8; //Placeholder, get the current logged on user's id

        this.priority = 'low';
        this.exp_date = '';
        this.exp_time = '';


    this.type = 'Vacation'; //init data variable
    this.details = '';
    this.days_period_of_leave = '';
    this.sub_user_id = null;

    var self = this; 
    var the_id = this.current_id
    axios.get('users-other-subs',{
      params: {
        id: the_id
        }
      })
    .then((res)=>{
      //console.log(res.data);
      self.other_subs = res.data;
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
