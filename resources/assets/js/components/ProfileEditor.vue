<template>
 
 <div >
  <!--
  <ul>
        <li> {{ profile.username }} </li> 
        <li> Todo B </li> 
        <li> Todo C </li> 
        </ul> -->
        
    <form class="form-inp" @submit.prevent="editProfile">
      <h2 class="form-inp-heading">Edit your profile</h2>
      <!-- OLD WAY, hard to fix, loop is better
        <div class="form-control">
          <label >Username</label>
          <input class="txtinp" v-model="profile.username" >
        </div>
        <div class="form-control">
          <label>Full Name</label>
          <input class="txtinp" >
        </div>
        <div class="form-control">
        <label>Email</label>
          <input class="txtinp" type="email" >
        </div>
        <div class="form-control">
        <label>Address</label>
          <input class="txtinp" >
        </div>
        <div class="form-control">
        <label>Contact Info (Facebook)</label>
          <input class="txtinp" >
        </div>
        <div class="form-control">
        <label>Contact Info (Intragram)</label>
          <input class="txtinp" >
        </div>
        <div class="form-control">
        <label>Contact Info (LINE ID)</label>
          <input class="txtinp" >
        </div>
        <div class="form-control">
        <label>Contact Info (Tel.)</label>
          <input class="txtinp" >
        </div>
        <div class="form-control">
        <label >Change Password</label>
          <input class="txtinp" type="password" placeholder="Password">
        </div>
        <div class="form-control">
        <label>Confirm Password Change</label>
          <input class="txtinp" type="password" placeholder="Password">
        </div>
        <div class="form-control">
        <label>Enter Password Before Edit</label>
          <input class="txtinp" type="password" placeholder="Password">
        </div>
        
-->   

        <div class="inputs" v-for="type in types" :key="type">
        <div class="form-control">
        <label>{{type.label}} : </label>
          <input v-if="type.type == 'text' && type.label == 'Username'" class="txtinp" v-model="profile.name">
          <input v-if="type.type == 'text' && type.label == 'Full Name'" class="txtinp" v-model="profile.fullname">
          <input v-if="type.type == 'email'" class="txtinp" type="email" v-model="profile.email">
          <input v-if="type.type == 'text' && type.label == 'Address'" class="txtinp" v-model="profile.address">
          <input v-if="type.type == 'text' && type.label == 'Contact Info (Facebook)'" class="txtinp" v-model="profile.facebook">
          <input v-if="type.type == 'text' && type.label == 'Contact Info (Intragram)'" class="txtinp" v-model="profile.ig">
          <input v-if="type.type == 'text' && type.label == 'Contact Info (LINE ID)'" class="txtinp" v-model="profile.lineid">
          <input v-if="type.type == 'tel'" class="txtinp" type="tel" v-model="profile.tel">
          <input v-if="type.type == 'password' && type.label == 'Change Password'" class="txtinp" type="password" placeholder="Password" v-model="profile.password_input">
          <input v-if="type.type == 'password' && type.label == 'Confirm Password Change'" class="txtinp" type="password" placeholder="Password" v-model="profile.password_confirm">
          <input v-if="type.type == 'password' && type.label == 'Enter Password Before Edit'" class="txtinp" type="password" placeholder="Password" v-model="profile.password_verify">
        </div>
        </div>


        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        <br>
        </form>

        
 </div>

</template>

<script>
  import axios from 'axios';

export default {
  name: 'Profile',
  data: {//LOCAL DATA BINDIND
    name: '',
    email: '',
    password: '',
    fullname: '',
    address: '',
    facebook: '',
    lineid: '',
    tel: '',
    ig: '',
    type: '',
    profile_image_src: '',
    password_confirm: '',
    password_verify: ''
  },
  components: {
    
  }, 
  props: ['profile'],
// CONNECT THIS TO BACKEND
methods: {
    editProfile () {
      alert('unused')
    }
  },
  data () {
    return {
      types: [
        {
          'type':'text',
          'label':'Username'
        },
        {
          'type':'text',
          'label':'Full Name'
        },
        {
          'type':'email',
          'label':'Email'
        },
        {
          'type':'text',
          'label':'Address'
        },
        {
          'type':'text',
          'label':'Contact Info (Facebook)'
        },
        {
          'type':'text',
          'label':'Contact Info (Intragram)'
        },
        {
          'type':'text',
          'label':'Contact Info (LINE ID)'
        },
        {
          'type':'tel',
          'label':'Contact Info (Tel.)'
        },
        {
          'type':'password',
          'label':'Change Password'
        },
        {
          'type':'password',
          'label':'Confirm Password Change'
        },
        {
          'type':'password',
          'label':'Enter Password Before Edit'
        }
      ]
    }
  },
    mounted(){
      /*
      this.current_id = 8; //Placeholder, get the current logged on user's id

    var self = this; 
    var the_id = this.current_id;
    axios.get('req-owner',{
      params: {
        id: the_id
        }
      })
    .then((res)=>{
      console.log(res.data);
      self.user = res.data;

      console.log(self.user.name);
    self.name =  self.user.name;
    self.email =  Object.assign({}, self.user.email);
    self.password =  'xxxx';
    self.fullname =  Object.assign({}, self.user.fullname); 
    self.address =  Object.assign({}, self.user.address); 
    self.facebook = Object.assign({}, self.user.facebook); 
    self.lineid = Object.assign({}, self.user.lineid); 
    self.tel = Object.assign({}, self.user.tel);
    self.ig = Object.assign({}, self.user.ig); 
    self.type = Object.assign({}, self.user.type); 
    self.profile_image_src = Object.assign({}, self.user.profile_image_src); 
    self.password_confirm =  '';
    self.password_verify =  '';
    8

    });*/


      
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
