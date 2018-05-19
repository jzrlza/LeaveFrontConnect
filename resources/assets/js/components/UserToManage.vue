<template>
 
 <div class="the-entire-object">
    <div class="form-control" v-show="this.state == 'init'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>{{ useracc.name }} </div>
      
    <div style="font-weight:bold" class='form-inp'>Type : {{ useracc.type }}</div>
    <div style="font-weight:bold" class='form-inp'>Department : {{ departments[useracc.dept_id-1].name }}</div>
    <!--<div style="font-weight:bold" class='form-inp' v-if="useracc.type == 'Subordinate' && useracc.super_id != null">Supervisor : {{ useracc.super_id }}</div>
  </div>-->
    <div class='ui bottom blue basic button' v-on:click="showEditForm">
       <i class='edit icon'></i> Edit User
      </div>

      <div class='ui bottom red solid button' v-on:click="askDeletion">
      <i class='trash icon'></i> Delete
    </div>
</div>

    </div>


    <div class="form-control" v-show="this.state == 'editing'">
      <div style="font-weight:bold" class='form-inp'>{{ useracc.name }} </div>
      <br>
      <div class='ui form'>
        <div class='field'>
          <label class="form-inp">Username</label>
          <input v-model="useracc.name">
        </div>
        <div class='field'>
          <label class="form-inp">E-mail</label>
          <input v-model="useracc.email">
        </div>
        <div class='field'>
          <label class="form-inp">Type</label>
          <select v-model="useracc.type">
          <option value="Supervisor" >Supervisor</option>
          <option value="Subordinate">Subordinate</option>
          </select>
        </div>
        <div class='field'>
          <label class="form-inp">Department</label>
          <select v-model="useracc.dept_id">
           <option :value=null>-None-</option>
            <option v-for="dept in departments" :value="dept.dept_id">
            {{ dept.name }}
          </option>
          </select>
        </div>
         <div class='field' v-if="useracc.type == 'Subordinate'">
          <label class="form-inp">Supervisor of this Subordinate</label>
          <select v-model="useracc.super_id">
            <option :value=null>-None-</option>
            <option v-for="user in users" :value="user.id" v-if="user.type == 'Supervisor'">
            {{ user.name }}
          </option>
          </select>
        </div>
        <div class='ui two button attached buttons'>
          <button class='ui bottom attached blue solid button' v-on:click="editUser(useracc)">
            Confirm
          </button>
          <button class='ui bottom attached grey solid button' v-on:click="initState">
            Cancel
          </button>
        </div>
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'deleting'">
      <div class='ui form'>
      <label style="font-weight:bold;" class='form-inp'>Delete {{ useracc.name }}? Are you sure?</label>
      <div class='ui two button attached buttons'>
      <button class='ui bottom attached red solid button' v-on:click="deleteUser(useracc)">
            Yes
          </button>
          <button class='ui bottom attached green solid button' v-on:click="initState">
            No
          </button>
        </div>
        </div>
    </div>

    <div class="form-control" v-show="this.state == 'edited'"> 
      <div class='ui form'>
      <label style="font-weight:bold;" class='form-inp'>Edited user, please refresh page.</label>
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'deleted'"> 
      <div class='ui form'>
      <label style="font-weight:bold;" class='form-inp'>Deleted user, please refresh page.</label>
      </div>
    </div>

  
 </div>

</template>

<script>
  import axios from 'axios';

export default {
  name: 'User',
  components: {
    
  }, 
  props: ['useracc','departments','users'],
  methods: {
      showEditForm() {
        this.state = 'editing';
      },
      editedState(){
        this.state = 'edited';
      },
      deletedState(){
        this.state = 'deleted';
      },
      initState() {
        this.state = 'init';
      },
      askDeletion() {
        this.state = 'deleting';
      },
      editUser(useracc) {
      var self = this;

      const userInfo = {
      'name': useracc.name,
      'email' : useracc.email,
      'type' : useracc.type,
      'dept_id' : useracc.dept_id,
      'super_id': useracc.super_id
        };

        var the_id = useracc.id;
        axios.put('user-edit',{
        params: {
          id: the_id
          }
        }, userInfo)
        .then((res)=>{
          //console.log(res.data)
          return res;
        });

        this.editedState();
    },
      deleteUser(useracc) {

        var the_id = useracc.id;
        axios.delete('user-delete',useracc)
        .then((res)=>{
          //console.log(res.data)
          return res;
        });
        this.deletedState();
      }
    }, 
    
    data () {
      return {
        state: 'init'
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
