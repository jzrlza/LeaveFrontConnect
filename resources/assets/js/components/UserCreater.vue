<template>
 
 <div>
    <div class="form-control" v-show="this.state == 'init'">
      
    <div class='ui bottom green solid button' v-on:click="showEditForm">
       <i class='plus icon'></i> Add New User
      </div>


    </div>

    <div class="form-control" v-show="this.state == 'editing'">
      <label style="font-weight:bold" class="form-inp"><i class='plus icon'></i> Add New User <i class='plus icon'></i></label>
      <br>
      <div class='ui form'>
        <div class='field'>
          <label class="form-inp">Username</label>
          <input v-model="useradd.name" defaultValue="">
        </div>
        <div class='field'>
          <label class="form-inp">Type</label>
          <select v-model="useradd.type">
          <option value="Supervisor">Supervisor</option>
          <option value="Subordinate">Subordinate</option>
          </select>
        </div>
        <div class='field'>
          <label class="form-inp">Department</label>
          <select v-model="useradd.dept_id">
             <!-- <option :value=0>-None-</option>-->
            <option v-for="dept in departments" :value="dept.dept_id">
            {{ dept.name }}
          </option>
          </select>
        </div>
        <div class='field' v-if="useradd.type == 'Subordinate'">
          <label class="form-inp">Supervisor of this Subordinate</label>
          <select v-model="useradd.super_id">
            <option :value=null>-None-</option>
            <option v-for="user in users" :value="user.id" v-if="user.type == 'Supervisor'">
            {{ user.name }}
          </option>
          </select>
        </div>
        <div class='ui two button attached buttons'>
          <button class='ui bottom attached green solid button' v-on:click="sendAddForm(useradd)">
            <i class='plus icon'></i> Confirm Add
          </button>
          <button class='ui bottom attached red solid button' v-on:click="initState(useradd)">
            <i class='x icon'></i> Cancel
          </button>
        </div>
      </div>
    </div>

  
 </div>

</template>

<script>

export default {
  name: 'UserAdd',
  components: {
    
  }, 
  props: ['useradd','departments','users'],
  methods: {
      showEditForm() {
        this.state = 'editing';
      },
       initState(useradd) {
        useradd.name = '';
        useradd.dept_id = 1;
        useradd.type = 'Supervisor';
        useradd.super_id = null;
        this.state = 'init';
      },
      sendAddForm(useradd) {
      if (useradd.name != '') {
        this.$emit('add-user', {
          'name':useradd.name,
          'dept_id':useradd.dept_id,
          'type':useradd.type,
          'super_id':useradd.super_id
        });
        this.initState(useradd);
      }
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
