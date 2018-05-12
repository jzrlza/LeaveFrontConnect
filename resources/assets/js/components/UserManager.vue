<template>
 <div>  
    <h2 class="form-inp-heading">Select and Create Users</h2>
    <useracc v-on:delete-useracc="deleteUseracc" v-for="useracc in users" v-bind:useracc="useracc" v-bind:users="users" :key="useracc" v-bind:departments="departments"></useracc>
    <useradd v-on:add-user="addUser" v-bind:useradd="useradd" v-bind:users="users" v-bind:departments="departments"></useradd>
    <br>
 </div>
</template>

<script>
import Useracc from './UserToManage.vue';
import Useradd from './UserCreater.vue';

export default {
  name: 'Users',
  components: {
    Useracc,
    Useradd
  }, 
  props: ['userer'],
// CONNECT THIS TO BACKEND
methods: {
    assignTask () {
      alert('unused')
    },
    deleteUseracc(useracc) {
      const userIndex = this.users.indexOf(useracc);
      this.users.splice(userIndex, 1);
    },
    addUser(useradd) {
      this.users.push({
        'username':useradd.username,
        'department':useradd.department,
        'type':useradd.type,
        'supervisor':useradd.supervisor
      });
    }
  }, 
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
    data () {
      return {
       users: [
          {
          'username':'super1',
          'department':'Engineering',
          'type':'Supervisor',
          'supervisor':null
          },
          {
          'username':'sub1',
          'department':'Engineering',
          'type':'Subordinate',
          'supervisor':'super1'
          },
          {
          'username':'sub2',
          'department':'Engineering',
          'type':'Subordinate',
          'supervisor':null
          }

        ],
        useradd: {
          username: '',
          department: 'Engineering',
          type: 'Supervisor',
          supervisor: null
        },
        departments:[
          'Engineering',
          'Agriculture',
          'Science',
          'Law and Ethics',
          'Fashion',
          'Zoology',
          'Industry',
          'Fishery'
        ]
      }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.form-inp, .form-inp-heading {
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
