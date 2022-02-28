<template>
    <div class="admineDashborad">
        <dashboardAdmine/>
    </div>
</template>

<script>
import dashboardAdmine from '../Components/Dashboard.vue'


  export default {
    name: 'AdmineDahboard',
    data() {
      return {

        }
    },
    methods:{

    },
    components:{
        dashboardAdmine
    }

  }
</script>
<style  scoped>
    .admineDashborad{
        height: 100vh;
        padding:2% 5%;
    }
</style>

