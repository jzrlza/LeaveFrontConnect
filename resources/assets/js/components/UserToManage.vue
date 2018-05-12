<template>
 
 <div>
    <div class="form-control" v-show="this.state == 'init'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>{{ useracc.username }} </div>
      
    <div style="font-weight:bold" class='form-inp'>Type : {{ useracc.type }}</div>
    <div style="font-weight:bold" class='form-inp'>Department : {{ useracc.department }}</div>
    <div style="font-weight:bold" class='form-inp' v-if="useracc.type == 'Subordinate' && useracc.supervisor != null">Supervisor : {{ useracc.supervisor }}</div>
  </div>
    <div class='ui bottom blue basic button' v-on:click="showEditForm">
       <i class='edit icon'></i> Edit User
      </div>

      <span class='ui bottom red solid button' v-on:click="askDeletion">
      <i class='trash icon'></i> Delete
    </span>


    </div>

    <div class="form-control" v-show="this.state == 'editing'">
      <div style="font-weight:bold" class='form-inp'>{{ useracc.username }} </div>
      <br>
      <div class='ui form'>
        <div class='field'>
          <label class="form-inp">Username</label>
          <input v-model="useracc.username">
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
          <select v-model="useracc.department">
            <option v-for="dept in departments" :value="dept">
            {{ dept }}
          </option>
          </select>
        </div>
         <div class='field' v-if="useracc.type == 'Subordinate'">
          <label class="form-inp">Supervisor of this Subordinate</label>
          <select v-model="useracc.supervisor">
            <option :value=null>-None-</option>
            <option v-for="user in users" :value="user.username" v-if="user.type == 'Supervisor'">
            {{ user.username }}
          </option>
          </select>
        </div>
        <div class='ui two button attached buttons'>
          <button class='ui bottom attached blue solid button' v-on:click="initState">
            Confirm
          </button>
        </div>
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'deleting'">
      <div class='ui form'>
      <label style="font-weight:bold;" class='form-inp'>Delete {{ useracc.username }}? Are you sure?</label>
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

  
 </div>

</template>

<script>

export default {
  name: 'User',
  components: {
    
  }, 
  props: ['useracc','departments','users'],
  methods: {
      showEditForm() {
        this.state = 'editing';
      },
       initState() {
        this.state = 'init';
      },
      askDeletion() {
        this.state = 'deleting';
      },
      deleteUser(useracc) {
      this.$emit('delete-useracc', useracc);
      }
    }, 
    //REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE OF Task matching 
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
