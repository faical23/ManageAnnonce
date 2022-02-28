<template>
    <div class="NotFound">
        <h1>Page not found</h1>
        <router-link to="/" >
            <button>Back to home</button>
        </router-link>
    </div>
</template>

<script>



  export default {
    name: 'NotFound',
    data() {
      return {

        }
    },
    methods:{


    },
    components:{

    }

  }
</script>
<style lang="scss" scoped>
.NotFound{
    text-align: center;
    margin: 50px 0px;
    button{
    cursor: pointer;
    padding: 10px 30px;
    border-radius: 100px;
    font-size: 17px;
    font-weight: 600;
    border: 1px solid #fac860;
    margin:40px 0px;
    margin-bottom: 20px;
    font-family: system-ui;
    color: white;
    background-color: #fac860;
    &:hover{
        color: #fac860;
        background: transparent;
    }
}
}

</style>




