<template>
 
 <div>

  
    <div class="form-control">
      <div class='ui form'>
    <div style="font-weight:bold" class='form-inp'>Type: {{ leave.type }} </div>
      </div>
    <div class='form-inp'>Details : {{ leave.details }}</div>
    <div style="font-weight:bold" class='form-inp'>Days period of leave : {{ leave.days_period_of_leave }}</div>
    <div style="font-weight:bold" class='form-inp'>Subordinate who request : {{ leave.user_fullname }}</div>
    <div class='form-inp' v-if='leave.sub_user_fullname != null'>Substitude subordinate : {{ leave.sub_user_fullname }}</div>
    <div class='form-inp'>From task : {{ leave.task_title }}</div>
    <div style="font-weight:bold" class='form-inp' v-if='leave.approved'>Approved : Yes</div>
    <div style="font-weight:bold" class='form-inp' v-if='!leave.approved'>Approved : No</div>


    

  </div>
   
 </div>

</template>

<script>

export default {
  name: 'Leave',
  components: {
    
  }, 
  props: ['leave']
  
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
