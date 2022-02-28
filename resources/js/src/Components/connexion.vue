<template>
    <section class="inscription">
        <form  v-if="Inscription">
            <div class="form__content">
                <h2>Create account</h2>
                <p>Already have account? <button class="have_not_acount" @click='Inscription=false'  >Sign in</button></p>
            </div>
            <div class="form__inputs">
                <div v-if="!EmailisValide">
                    <div class="form__inputs__Email">
                        <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 0 24 24" width="35px" fill="#000000"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M22 6c0-1.1-.9-2-2-2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6zm-2 0l-8 5-8-5h16zm0 12H4V8l8 5 8-5v10z"/></svg>
                        <input type="Email" placeholder="Jhon@exemple.com" v-model="EmailInscription"  pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Email invalide">
                    </div>
                    <div class="form__button">
                        <button  @click.prevent='ValideEmailFuntion' type="submit" class="primary_GetStarted " >Continue with email</button>
                    </div>
                </div>
                <div v-if="EmailisValide">
                    <div class="form__inputs__Name">
                        <input type="text" placeholder="nom" v-model="nom"  required title="nom invalide">
                    </div>
                    <div class="form__inputs__Name">
                        <input type="text" placeholder="prénom" v-model="prénom"  required title="prénom invalide">
                    </div>
                    <div class="form__inputs__Phone">
                        <input type="number" placeholder="age" v-model="age"  required title="Age invalide">
                    </div>
                     <div class="form__inputs__Phone">
                        <input type="text" placeholder="Raison social" v-model="Raisonsocial"  required title="Raison social invalide">
                    </div>
                    <div class="form__inputs__Password">
                        <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 0 24 24" width="35px" fill="#000000"><g fill="none"><path d="M0 0h24v24H0V0z"/><path d="M0 0h24v24H0V0z" opacity=".87"/></g><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z"/></svg>
                        <input type="password" placeholder="********"  v-model="passwordInscription"   title="Password invalide">
                    </div>
                </div>
            </div>
            <div class="form__button" v-if="EmailisValide">
                <button @click.prevent='InscriptionFunction' type="submit" class="primary_GetStarted " >Sign up</button>
            </div>
        </form>
        <form  v-else>
            <div class="form__content">
                <h2>Welcome again</h2>
                <p>I don't have account? <button class="have_not_acount" @click='Inscription=true' >Sign up</button></p>
            </div>
            <div class="form__inputs">
                <div class="form__inputs__Email">
                    <input type="Email" placeholder="Jhon@exemple.com" v-model="EmailLogin"  pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Email invalide">
                </div>
                <div class="form__inputs__Password">
                    <svg xmlns="http://www.w3.org/2000/svg" height="35px" viewBox="0 0 24 24" width="35px" fill="#000000"><g fill="none"><path d="M0 0h24v24H0V0z"/><path d="M0 0h24v24H0V0z" opacity=".87"/></g><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z"/></svg>
                        <input type="password" placeholder="********"  v-model="passwordLogin"   title="Password invalide">
                </div>
            </div>
            <div class="form__button">
                <button @click.prevent='LoginFunction' type="submit" class="primary_GetStarted ">Sign up</button>
            </div>
        </form>
    </section>
</template>

<script>

import axios from "axios";
import Swal from 'sweetalert2'
import API_URL from '../../config'


export default {


    name:'Inscription',
    data (){
        return{
            EmailisValide:false,
            Inscription:true,
            EmailInscription:'',
            nom:'',
            prénom:'',
            age:'',
            Raisonsocial:'',
            passwordInscription:'',
            EmailLogin:'',
            passwordLogin:'',


        }
    },
    components :{

    },
    methods:{
        ValideEmailFuntion(){
            const RG_Email = new RegExp("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$");
            if (RG_Email.test(this.EmailInscription)){
                console.log(this.EmailInscription)
                axios.post(`${API_URL}api/auth/checkemail`,{email:this.EmailInscription})
                .then(res =>{

                    res.status == 201 &&
                                                Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'warning',
                                                    title: 'email already exit',
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                })

                })
                .catch(err =>{
                    err.response.status == 404 && (this.EmailisValide = true)
                    err.response.status == 500 &&  Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'error',
                                                    title: 'Invalide email',
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                })

                })
            }
            else{
                Swal.fire({
                    position: 'top-right',
                    icon: 'error',
                    title: 'Invalide email',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

        },
        InscriptionFunction(){
            if(this.nom !== '' && this.prénom !== '' && this.age !== '' && this.Raisonsocial !== '' && this.passwordInscription !== ''){
                console.log(this.nom,this.prénom,this.age,this.Raisonsocial,this.passwordInscription)
                const Data = {
                    name:this.nom,
                    prénome:this.prénom,
                    age:this.age,
                    email:this.EmailInscription,
                    password:this.passwordInscription,
                    raisonsocial:this.Raisonsocial
                }
                axios.post(`${API_URL}api/auth/inscription`,Data)
                .then(res =>{
                        Swal.fire({
                            position: 'top-right',
                            icon: 'success',
                            title: 'successfly inscription',
                            showConfirmButton: false,
                            timer: 2000
                        })
                        this.$emit('removePopup')
                        this.$store.commit('setAuth',res.data)

                })
                .catch(err =>{
                    console.log(err)
                })


            }
            else{
                    Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'error',
                                                    title: 'please complete all failed',
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                })
                    }
        },
        LoginFunction(){
            if(this.EmailLogin != '' && this.passwordLogin != ''){
                console.log(this.EmailLogin,this.passwordLogin)
                const Data ={
                    email:this.EmailLogin,
                    password:this.passwordLogin
                }
                axios.post(`${API_URL}api/auth/login`,Data)
                .then(res =>{
                        Swal.fire({
                            position: 'top-right',
                            icon: 'success',
                            title: 'successfly Login',
                            showConfirmButton: false,
                            timer: 2000
                        })
                        this.$emit('removePopup')
                        this.$store.commit('setAuth',res.data)


                })
                .catch(err =>{
                    (err.response.status = 401) &&  Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'error',
                                                    title: 'email or password incorrect',
                                                    showConfirmButton: false,
                                                    timer: 2000
                    })
                })

            }
            else{
                Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'error',
                                                    title: 'please complete all failed',
                                                    showConfirmButton: false,
                                                    timer: 2000
                })
            }

        }

    }
}
</script>
<style  lang="scss" scoped>
.inscription{

    button{
        cursor: pointer;
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
