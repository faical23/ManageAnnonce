<template>
    <section class="inscription">
        <form @submit="Onsubmit" >
            <div class="form__content">
                <h2>Create annonce</h2>
            </div>
            <div class="form__inputs">
                    <div class="form__inputs__Name">
                        <input type="text" placeholder="title" v-model="titre"  required title="nom invalide">
                    </div>
                    <div class="form__inputs__Name">
                        <input type="text" placeholder="adress" v-model="adress"  required title="prénom invalide">
                    </div>
                    <div class="form__inputs__Phone">
                        <input type="text" placeholder="phone" v-model="phone"  required title="Age invalide">
                    </div>
                     <div class="form__inputs__Phone">
                        <input type="text" placeholder="whatssap" v-model="whatssap"  required title="Raison social invalide">
                    </div>
                    <textarea v-model="description" placeholder="description"></textarea>
                    <h5>Gallerie</h5>
                    <div class="ImgZone">
                        <UploadImages
                                @changed="handleImages"
                                clearAll="remove all images"
                         />
                    </div>

            </div>
            <div class="form__button">
                <button type="submit" @click.prevent='CreateAnnonce' class="primary_GetStarted ">Create</button>
            </div>
        </form>

    </section>
</template>

<script>
import UploadImages from "vue-upload-drop-images"
import axios from 'axios'
import Swal from 'sweetalert2'
import API_URL from '../../config'

export default {
    name:'Inscription',
    data (){
        return{
            titre:'',
            adress:"",
            phone:"",
            whatssap:'',
            description:"",
            images:'',
        }
    },
    components :{
        UploadImages
    },
    methods:{
            handleImages(files){
                this.images = files
            },
            CreateAnnonce(){
                if(this.titre !== "" && this.adress !== "" && this.phone !== "" &&
                    this.whatssap !== "" && this.description !== ""
                    ){
                        if(this.images.length !== 0){
                            let formData = new FormData();
                            formData.append("titre", this.titre);
                            formData.append("adress", this.adress);
                            formData.append("phone", this.phone);
                            formData.append("whatssap", this.whatssap);
                            formData.append("description", this.description);
                            for (let i = 0; i < this.images.length; i++) {
                                let file = this.images[i];
                                formData.append("files[" + i + "]", file);
                            }

                            axios.post(`${API_URL}api/annonce`,
                            formData,
                            {
                                headers: {
                                    'Content-Type': 'multipart/form-data',
                                    Authorization: 'Bearer ' + localStorage.getItem('token')
                                }
                            })
                            .then(res=>{
                                         Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'success',
                                                    title: 'successfly create announcement',
                                                    showConfirmButton: false,
                                                    timer: 2000
                                        })
                                        this.$emit('removePopup')
                                console.log(res)
                            })
                            .catch(err=>{
                                console.log(err.response.status)
                                err.response.status == 413 &&Swal.fire({
                                                        position: 'top-right',
                                                        icon: 'error',
                                                        title: 'size of images is so big please choose another image',
                                                        showConfirmButton: false,
                                                        timer: 2000
                                                        })

                            })
                        }
                        else{
                                            Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'error',
                                                    title: 'please you should add at least one picture',
                                                    showConfirmButton: false,
                                                    timer: 2000
                                        })
                        }

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
    form{
        height: 700px;
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
