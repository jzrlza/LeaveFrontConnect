<template>
   <h3>This shows that the route is really working!!</h3>
   @{{ message }}
   <router-link to="/vue"><a>Back to the root</a></router-link>
</template>
<script>
export default {
  data () {
    return {
      message: 'Hoera!!!!'
    };
  }
};
</script>