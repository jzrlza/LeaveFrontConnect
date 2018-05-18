<template>
 
 <div >
    <form class="form-inp" @submit.prevent="assignTask">
      <h2 class="form-inp-heading">Assign a Task</h2>

      <div class="inputs" v-for="type in types" :key="type">
        <div class="form-control">
        <label>{{type.label}} : </label>
          <input v-if="type.type == 'text'" class="txtinp">
          <input v-if="type.type == 'date'" class="txtinp" type="date">
          <input v-if="type.type == 'time'" class="txtinp" type="time">
        </div>
        </div>

        <div class="form-control">
        <label>Select Subordinate : </label>
        <select>
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
  components: {
    
  }, 
  props: ['task'],
// CONNECT THIS TO BACKEND
methods: {
    assignTask () {


      alert('Task Assigned!')
    }
    
  },
  data () {
    return {
      types: [
        {
          'type':'text',
          'label':'Task Title'
        },
        {
          'type':'text',
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
