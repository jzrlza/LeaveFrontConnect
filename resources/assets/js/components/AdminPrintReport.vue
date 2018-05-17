<template>
 
  <div>
  <navbar></navbar>

  <h2> Print Report </h2>

  <leave  v-for="leave in leaves" v-bind:leave="leave" :key="leave"></leave>
  <br>
  <div class='ui bottom green solid button' v-on:click="printSomething">
        Print
      </div>
      <br>
  </div>
  
</template>

<script>
import Navbar from './AdminNavBar';
import Leave from './LeaveInHistory';
import axios from 'axios';

export default {
  name: 'AdminUsers',
  components: {
    Navbar,
    Leave
  },
  methods: {
    printSomething(){
      var columns = [
        {
          title:"Leave Request By",
          dataKey:'main_user_id' 
        },
        {
          title:"Type",
          dataKey:'type'
        },
        {
          title:"Days of Leaving",
          dataKey:'days_period_of_leave'
        },
        {
          title:"Approval",
          dataKey:'approved'
        }
      ]


      var doc = new jsPDF()

      doc.text("Leave Requests Throughout System", 65, 10);

      doc.autoTable(columns, this.leaves)
      //doc.text("Hello World", 1, 1);
      doc.save('report.pdf')
/*
       var doc = new jsPDF('p','pt', 'a4', true);
      var header = [1,2,3,4];
      doc.table(10, 10, $('#test').get(0), this.table, {
      left:10,
      top:10,
      bottom: 10,
      width: 170,
      autoSize:false,
      printHeaders: true
      });
      doc.save('sample-file.pdf');*/
    }
  },
  data () {
    return {
      msg: 'ADMIN USER PLACEHOLDER',
      leaves:[]/*
      leaves:[
        {
            'type':'Vacation',
            'details':'Need to take some days off, it is getting tiring',
            'days_period_of_leave': 20.0,
            'user_fullname': 'Agenda Timothy',
            'sub_user_fullname': 'Ryla Michal',
            'task_title': 'Mine some bitcoins.',
            'approved':true

        },
        {
            'type':'Personal Errand',
            'details':'I got some post delivery that is urgently required for my parent\'s life',
            'days_period_of_leave': 4.0,
            'user_fullname': 'Fisha Microra',
            'sub_user_fullname': null,
            'task_title': 'Make a security platform for our company about top secret files.',
            'approved':true

        },
        {
            'type':'Sick',
            'details':'I got some flus from doing dumpster diving, I shouldn\'t have done that!',
            'days_period_of_leave': 5.5,
            'user_fullname': 'Bobby Willhace',
            'sub_user_fullname': 'Alison Coverclove',
            'task_title': 'Invent a machine in the office that will work for the product for horses\' health.',
            'approved':false

        }

      ]*/
    }
  },
    mounted(){
    var self = this;
    axios.get('reqs-get')
    .then((res)=>{
      self.leaves = res.data;
    });
    
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
