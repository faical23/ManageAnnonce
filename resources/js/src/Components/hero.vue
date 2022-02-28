<template>
    <div class="hero__container">
        <h1>you can search about any annonce here</h1>
            <div  @click="$emit('OpenAnnonce')" class="hero_right_input"  >
                <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 0 24 24" width="40px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>
                <span>search by title ...</span>
            </div>
    </div>
</template>

<script>


  export default {
    name: 'hero__container',
    emits:['OpenAnnonce'],
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
    .hero__container{
        margin-top: 150px;
        border-radius: 20px;
        text-align: center;
        padding: 130px 0px;
        background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)),url("../assets/img/immobilier.jpg");
        // background-image: url("../assets/img/immobilier.jpg");
        background-repeat: no-repeat;
        background-size:cover;
        background-position: center;
        h1{
            font-size: 40px;
            font-weight: bolder;
            color: white;
            font-family: system-ui;
        }
        .hero_right_input {
            display: flex;
            align-items: center;
            padding: 5px 90px 5px 40px;
            cursor: pointer;
            background-color: white;
            width:50%;
            margin: 30px auto;
            border-radius: 100px;

            span {
            width: 100%;
            padding: 0px;
            position: relative;
            left: 20px;
            font-weight: 100;
            text-overflow: ellipsis;
            white-space: nowrap;
            line-height: 18px;
            letter-spacing: 1.1px;
            font-family: system-ui;
            transition: 0.5s ease-in-out;
            text-align: start;
            color: #828282;
            font-size: 17px;
            font-family: system-ui;
            font-weight: 500;
            }
            }
            svg {
            fill: #828282;
            transition: 0.5s ease-in-out;
            }
            &:hover {
            span,
            svg {
                color: black;
                fill: black;
            }
            }

    }
</style>




