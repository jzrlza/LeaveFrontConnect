<template>
 
 <div>

  
    <div class="form-control" v-show="this.state == 'pre-select'">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Type: {{ leave.type }} </div>
      </div>
    <div class='form-inp'>Details : {{ leave.details }}</div>
    <div style="font-weight:bold" class='form-inp'>Days period of leave : {{ leave.days_period_of_leave }}</div>
    <div style="font-weight:bold" class='form-inp'>Subordinate who request : {{ leave.user_fullname }}</div>
    <div class='form-inp' v-if='leave.sub_user_fullname != null'>Substitude subordinate : {{ leave.sub_user_fullname }}</div>
    <div class='form-inp'>From task : {{ leave.task_title }}</div>

    <div class='ui bottom green solid button' v-on:click="approve">
        Approve
      </div>
    </div>

    <div class="form-control" v-show="this.state == 'approved'">
      <div class='ui form'>
        <div style="font-weight:bold">The {{ leave.type }} Leave of {{ leave.user_fullname }} has been approved. </div>
                
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

export default {
  name: 'Leave',
  components: {
    
  }, 
  props: ['leave'],
  methods: {
      approve() {
        this.state = 'approved';
      },
      dismiss() {
        this.state = 'dismissed';
      }
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
