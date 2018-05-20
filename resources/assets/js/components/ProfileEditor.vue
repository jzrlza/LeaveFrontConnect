<template>
 
 <div >
        
    <form class="form-inp" >
      <h2 class="form-inp-heading">Edit your profile</h2>


        <div class="inputs" v-for="type in types" :key="type">
        <div class="form-control">
        <label>{{type.label}} : </label>
          <input v-if="type.type == 'text' && type.label == 'Username'" class="txtinp" v-model="name" :placeholder=profile.name>
          <input v-if="type.type == 'text' && type.label == 'Full Name'" class="txtinp" v-model="fullname" :placeholder=profile.fullname>
          <input v-if="type.type == 'email'" class="txtinp" type="email" v-model="email" :placeholder=profile.email>
          <input v-if="type.type == 'text' && type.label == 'Address'" class="txtinp" v-model="address" :placeholder=profile.address>
          <input v-if="type.type == 'text' && type.label == 'Contact Info (Facebook)'" class="txtinp" v-model="facebook" :placeholder=profile.facebook>
          <input v-if="type.type == 'text' && type.label == 'Contact Info (Intragram)'" class="txtinp" v-model="ig" :placeholder=profile.ig>
          <input v-if="type.type == 'text' && type.label == 'Contact Info (LINE ID)'" class="txtinp" v-model="lineid" :placeholder=profile.lineid>
          <input v-if="type.type == 'tel'" class="txtinp" type="tel" v-model="tel" :placeholder=profile.tel>
          <input v-if="type.type == 'password' && type.label == 'Change Password'" class="txtinp" type="password" placeholder="New Password" v-model="password_new">
          <input v-if="type.type == 'password' && type.label == 'Confirm Password Change'" class="txtinp" type="password" placeholder="Password Confirm" v-model="password_confirm">
          <input v-if="type.type == 'password' && type.label == 'Enter Password Before Edit'" class="txtinp" type="password" placeholder="Current Password" v-model="password_verify">
        </div>
        </div>


        <button class="btn btn-lg btn-primary btn-block" type="submit" v-on:click="editProfile(profile)">Submit</button>
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
    fullname: '',
    address: '',
    facebook: '',
    lineid: '',
    tel: '',
    ig: '',
    type: '',
    profile_image_src: '',
    password_new: '',
    password_confirm: '',
    password_verify: ''
  },
  components: {
    
  }, 
  props: ['profile'],
// CONNECT THIS TO BACKEND
methods: {
    editProfile (profile) {
      alert(profile.password);
      var password_token = null;
      if (profile.password == this.password_verify){
        password_token = this.user.password;
      
      if (this.password_new == this.password_confirm){
        password_token = this.password_new;
      }


      var update_user = {
          'id': profile.id,
          'name': this.name,
          'fullname' : this.fullname,
          'email': this.email,
          'address': this.address,
          'facebook': this.facebook,
          'ig': this.ig,
          'lineid': this.lineid,
          'tel': this.tel,
          'password': password_token
        };

    axios.post('user-edit-profile', update_user)
    .then((res)=>{
      console.log(res.data);
      return res;

        });
      } else {
        alert('Invalid Current Password');
      }
      
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


    //var self = this; 

   // self.name =  profile.name+'';
   // self.email =  Object.assign({}, profile.email);
    //self.password =  '';
   // self.fullname =  Object.assign({}, profile.fullname); 
   // self.address =  Object.assign({}, profile.address); 
   // self.facebook = Object.assign({}, profile.facebook); 
   // self.lineid = Object.assign({}, profile.lineid); 
   // self.tel = Object.assign({}, profile.tel);
   // self.ig = Object.assign({}, profile.ig); 
   // self.type = Object.assign({}, profile.type); 
   // self.profile_image_src = Object.assign({}, profile.profile_image_src); 
   // self.password_confirm =  '';
   // self.password_verify =  '';



      
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
