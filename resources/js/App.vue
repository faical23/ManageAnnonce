<template>
    <div  id="App">
        <router-view/>
    </div>
</template>

<script>

export default {
  name: "App",
  components: {
  },
  data() {
    return {

    };
  },
  methods:{
    checkUserLogin(){
      if(localStorage.getItem('token')){
            this.$store.dispatch('loadData')
            console.log(localStorage.getItem('token'))
      }
    },
  },
  mounted(){
    this.checkUserLogin()
}
}
</script>

<style >
    *{
        padding:0;
        margin:0;
        box-sizing:border-box;
        font-family: system-ui;
        text-decoration: none;
    }
    .swal2-container.swal2-backdrop-show{
        position: absolute;
        z-index: 7000000000;
    }
    .agile__slides img{
        width: 627px !important;
        height: 400px;
        object-fit: cover;
    }

</style>
