<template>
 
 <div >
    <form class="form-inp" @submit.prevent="assignTask">
      <h2 class="form-inp-heading">Assign a Task</h2>

      <div class="inputs" v-for="type in types" :key="type">
        <div class="form-control">
        <label>{{type.label}} : </label>
          <input v-if="type.type == 'title'" class="txtinp" v-model='title'>
          <input v-if="type.type == 'details'" class="txtinp" v-model='detail'>
          <input v-if="type.type == 'date'" class="txtinp" type="date" v-model='deadline_date'>
          <input v-if="type.type == 'time'" class="txtinp" type="time" v-model='deadline_time'>
        </div>
        </div>

        <div class="form-control">
        <label>Select Subordinate : </label>
        <select v-model='user_id'>
            <option :value=null>-None-</option>
            <option v-for="user in subs" :value="user.id" v-if="user.type == 'Subordinate'">
            {{ user.name }}
          </option>
          </select>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Assign</button>
        <br>
        </form>
 </div>

</template>

<script>
import axios from 'axios';

export default {
  name: 'Task',
  data: {//LOCAL DATA BINDIND
    title: '',
    detail: '',
    deadline_date: '',
    deadline_time: '',
    user_id: ''
  },
  components: {
    
  }, 
  props: ['title'],

methods: {
    assignTask () {
    const task = {
      'title': this.title,
      'detail' : this.detail,
      'deadline' : this.deadline_date+" "+this.deadline_time+":00",
      'user_id' : this.user_id
    };
    /*
    if (this.title != ''){
      alert(this.title);
      alert(task['title']);
    }
    if (this.detail != ''){
      alert(this.detail);
      alert(task['detail']);
    }
    if (this.deadline_date != ''){
      alert(this.deadline_date);
      alert(task['deadline']);
    }
    if (this.deadline_time != ''){
      alert(this.deadline_time);
      alert(task['deadline']);
    }
    if (this.user_id != null){
      alert(this.user_id);
      alert(task['user_id']);
    }*/
    
    
    axios.post('assign-task', task)
    .then(res => {
       console.log(res);
        return res;
    });

     // alert(this.title+'is Assigned!');
    }
    
  },
  data () {
    return {
      
      types: [
        {
          'type':'title',
          'label':'Task Title'
        },
        {
          'type':'details',
          'label':'Task Details'
        },
        {
          'type':'date',
          'label':'Deadline Date'
        },
        {
          'type':'time',
          'label':'Deadline Time'
        }
        ],
        subs : []/* 
          {
            'username':'sub1',
            'selected':false
          },
          {
            'username':'sub2',
            'selected':false
          },
          {
            'username':'sub3',
            'selected':false
          }
        ]*/
      }
    },
    mounted(){
    this.title = ''; //init data variable
    this.detail = '';
    this.deadline_date = '';
    this.deadline_time = '';
    this.user_id = null;

    var self = this; 
    axios.get('users-subs')
    .then((res)=>{
      //console.log(res.data);
      self.subs = res.data;
    });

    
      
    }
  
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.form-inp {
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
