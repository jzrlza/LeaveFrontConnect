<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>{{ task.title }} </div>
      </div>
    <div class='form-inp'>Due Date : {{ task.deadline_date }} {{ task.deadline_time }}</div>

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
          <select name="priority">
          <option value="low">Low</option>
          <option value="mid">Medium</option>
          <option value="hi">High</option>
          </select>
        </div>
        <div class='field'>
          <label class="form-inp">Expected Complete Date</label>
          <input type="date">
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
          <select name="priority">
          <option value="low">Vacation</option>
          <option value="mid">Personal Errand</option>
          <option value="hi">Sick</option>
          </select>
        </div>
        <div class='field'>
          <label class="form-inp">Details</label>
          <input>
        </div>
        <div class='field'>
          <label class="form-inp">Days Period Of Leave</label>
          <input type="number">
        </div>
        <div class='field'>
          <label class="form-inp">Pick Substitude</label>
          <select name="substitude">
          <option value="none">-None-</option>
          <option value="temp">-----LOOP INTO DATABASE OF "USER.type = SUB, USER.username not == this.username"-----</option>
          </select>
        </div>
        <br>
      </div>
     <div class='ui two button attached buttons'>
          <button class='ui bottom attached green solid button' v-on:click="submit">
            Submit
          </button>
        </div>
    </div>

  </div>
   
 </div>

</template>

<script>

export default {
  name: 'Task',
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
       submit() {
        this.state = 'pre-select'; //REMOVE THIS IF CONNECT BACK-END
      },
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
