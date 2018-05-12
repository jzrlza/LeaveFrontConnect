<template>
  <div class="login-wrapper border border-light">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <h2 style="text-align: center;" class="form-signin-heading">LeaveU - Simple Leave for Tasks Web Application</h2>
    <form class="form-signin" v-on:submit.prevent="easyLogin">
      <h2 class="form-signin-heading">Please sign in</h2>
      <div class="alert alert-danger" v-if="error">{{ error }}</div>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input v-model="username" id="inputUsername" class="form-control" placeholder="Username" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input v-model="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

    </form>
    <a class="btn btn-lg btn-primary btn-block" type="submit" href="admin-users" >Sign in as Admin (Placeholder)</a>
    <a class="btn btn-lg btn-primary btn-block" type="submit" href="super-profile">Sign in as Supervisor (Placeholder)</a>
    <a class="btn btn-lg btn-primary btn-block" type="submit" href="sub-profile">Sign in as Subordinate (Placeholder)</a>
  </div>
</template>

<script>
export default {
  name: 'Login',
  // CONNECT THIS TO BACKEND
  data () {
    return {
      username: '',
      password: '',
      error: false,
      users: [//REMOVE THIS WHEN CONECT TO BACKEND WITH DATABASE 
          {
          'username':'admin1',
          'password':'friendship',
          'type':'Administrator',
          'supervisor':null
          },
          {
          'username':'super1',
          'password':'dragonborn',
          'type':'Supervisor',
          'supervisor':null
          },
          {
          'username':'sub1',
          'password':'casanova',
          'type':'Subordinate',
          'supervisor':'super1'
          },
          {
          'username':'sub2',
          'password':'harempants',
          'type':'Subordinate',
          'supervisor':null
          }

        ]
    }
  },
  methods: {
    login () {
      this.$http.post('/auth', { user: this.username, password: this.password }).then(request => this.loginSuccessful(request)).catch(() => this.loginFailed())
    },
    loginSuccessful (req) {
      if (!req.data.token) {
        this.loginFailed()
        return
      }

      localStorage.token = req.data.token
      this.error = false

      this.$router.replace(this.$route.query.redirect || '/home')
    },

    loginFailed () {
      this.error = 'Login failed!'
      delete localStorage.token
    },

    easyLogin(){
        var user;
        for (user in this.users) {
          if(this.username == user.username){
            if(this.password == user.password){
              //Auth access
              if(user.type == 'Administrator'){
                  alert('Admin!')
                  router.push('/admin-users')
              } else if (user.type == 'Supervisor'){
                  alert('Super!')
                  router.push('/super-profile')
              } else {
                  alert('Sub!')
                  router.push('/sub-profile')
              }
            }
          }
        }
    }

  }
}
</script>

<style lang="css">

.login-wrapper {
  background: #fff;
  width: 70%;
  margin: 12% auto;
}

.form-signin {
  max-width: 330px;
  padding: 10% 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
