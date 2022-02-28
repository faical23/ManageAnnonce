<template>
    <section class="inscription">
        <form >
            <div class="form__content">
                <h2>Search your annonce</h2>
            </div>
            <div class="form__inputs">
                    <div class="form__inputs__Name">
                        <input @keyup="Search()" type="text" placeholder="title" v-model="titre"  required title="nom invalide">
                    </div>
                    <div class="Result" >
                        <router-link v-for="item,n in Result" :key="n" :to="'/DetailAnnonce/'+item?.id" >
                            <h4>{{item?.titre.slice(0,25)}} ..</h4>
                        </router-link>
                        <p class="NotFound" v-if="notfound">Not found</p>
                    </div>
            </div>
        </form>

    </section>
</template>

<script>
import axios from 'axios'

export default {
    name:'Inscription',
    data (){
        return{
            titre:'',
            Result:[],
            notfound:false
        }
    },
    components :{
    },
    methods:{
        Search(){
            if(this.titre != ''){
                console.log(this.titre)
                axios.get(`api/annonce/Search/${this.titre}`)
                .then(res =>{
                    this.Result = res.data.annonces
                    res.data.annonces.length === 0 ? this.notfound = true :this.notfound = false
                    console.log(this.notfound)
                    console.log(res)
                })
                .then(err =>{
                    console.log(err)
                })
            }

        }
    }
}
</script>
<style  lang="scss" scoped>
.Result{
    height: 300px;
    overflow-y:scroll;
}
a{
    color: black;
    font-size: 17px !important;
    text-decoration:none;
}
h4{
    text-align: initial;
    padding: 10px 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 11px -9px black;
    background: #e9e9e9;
    margin-bottom: 5px;
    cursor: pointer;
    font-size: 17px !important;
    &:hover{
        background:white;
    }
}
.NotFound{
    color: red;
    text-align: center;
}
.inscription{
    form{
        height: 500px;
        overflow-y: scroll;
    }
    .ImgZone{
        margin: 20px 0px;

    }
    button{
        cursor: pointer;
    }
    textarea{
        border: 1px solid #c4c4c4;
        display: flex;
        align-items: center;
        border-radius: 10px;
        padding: 10px 20px;
        margin: 30px 0px;
        width: 100%;
        height: 100px;
    }
    h5{
        text-align: start;
        font-size: 21px;
        margin-bottom: 20px;
    }
    form{
        width: 25%;
        position: fixed;
        z-index: 3000000000;
        text-align: center;
        padding: 40px 60px;
        border-radius: 15px;
        background-color: white;
        box-shadow: 0px 0px 11px -3px rgba(0,0,0,0.41);
        top: 50%;
        left: 50%;

        transform: translate(-50%, -50%);
        .form__content{
            border-bottom: 1px solid black;
            margin-bottom: 40px;
            h2{
                font-size: 30px;
                color:#fac860;
            }
            p,.have_not_acount{
                color: black;
                font-size: 14px;
                padding: 4px 0px;
            }
            .have_not_acount{
                color: #fac860 !important;
                border: none !important;
                background:  none !important;
                &:hover{
                    color: #fbba2d !important;
                }
            }
        }
        .form__inputs{
            .is-invalid{
                border: 1px solid red !important;
            }
            .form__inputs__Name,
            .form__inputs__Email,
            .form__inputs__Phone,
            .form__inputs__Password{
                border: 1px solid #c4c4c4;
                display:flex;
                align-items: center;
                border-radius: 50px;
                padding: 0px 20px;
                margin: 30px 0px;

                input{
                    position: relative;
                    left: 10px;
                    border: none !important;
                    background: none;
                    box-shadow: none;
                    padding: 0px;
                    width: 100%;
                    border-radius: 0px !important;
                    outline: none;
                    padding: 15px 0px;
                }
                ::placeholder,svg{
                    color:#c4c4c4;
                    fill:#c4c4c4;
                    font-size: 17px;
                }
                svg{
                    width: 28px;
                    height: 28px;
                }
                .show_password{
                    background: none !important;
                    transition: 0.3s ease-in-out;
                    border:none;
                    &:hover{
                        svg{
                            fill: #fbba2d;
                        }
                    }
                }
                &:hover{
                    border: 1px solid ;
                }

            }
        }
        .form__button{
            button{
            cursor: pointer;
            padding: 10px 30px;
            border-radius: 100px;
            font-size: 17px;
            font-weight: 600;
            border: 1px solid #fac860;
            margin-bottom: 20px;
            font-family: system-ui;
            color: white;
            background-color: #fac860;
            width:100%;
            &:hover{
                color: #fac860;
                background: transparent;
            }
                        }
        }
        .form_errorField{
            color: red;
        }
        @media only screen and (max-width: 1420px) {
            width: 35% !important;
        }
        @media only screen and (max-width: 1024px) {
            width: 45% !important;
        }
        @media only screen and (max-width: 768px) {
            width: 60% !important;
        }
        @media only screen and (max-width: 560px) {
            width: 85% !important;
            padding: 40px !important;
        }
    }
}


</style>
