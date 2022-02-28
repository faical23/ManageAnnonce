<template>
    <div class="DetailAnnonce">
        <div v-if="OpenConnexion || OpenAnnonce" class="BlackPage" @click='removeAllpopup'></div>
        <myNavbar  @connexion='OpenConnexion=true'  @annonce='OpenAnnonce = true'/>
        <Connexion v-if="OpenConnexion" @removePopup='removeAllpopup' />
        <Annonce v-if="OpenAnnonce" @removePopup='removeAllpopup' />
        <div class="DetailAnnonce_info">
                <div class="simpleinfro">
                    <h1>{{titre}}</h1>
                    <p> date d'ajoutée : {{Convertdate(date)}}</p>
                    <div class="Gallery">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators"  >
                                <li data-target="#carouselExampleIndicators" v-for="slide,n in slides" :key="slide" :data-slide-to="n" :class="n==1 ? 'active' : '' "></li>
                            </ol>
                            <div class="carousel-inner">
                                <div v-for="slide,n in slides" :key="slide" :class="['carousel-item', n == 0 ? 'active' : '']"  >
                                    <img class="d-block w-100" :src="slides[n]" alt="First slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                            </div>
                    </div>

                    <div class="description">
                        {{description}}
                    </div>
                </div>
                <div class="infopresonnel">
                    <div class="ContactUsForm">
                        <h4>Voulez-vous être contacté?</h4>
                        <div class="form__inputs__Name">
                            <input type="text" placeholder="name" v-model="FormName"  required title="nom invalide">
                        </div>
                        <div class="form__inputs__Name">
                            <input type="text" placeholder="phone" v-model="FormPhone"  required title="nom invalide">
                        </div>
                        <div class="form__inputs__Name">
                            <input type="text" placeholder="email" v-model="FormEmail"  required title="nom invalide">
                        </div>
                        <textarea v-model="FormComment" placeholder="description"></textarea>

                        <div class="form__button">
                            <button type="submit" @click.prevent='SendEmail' class="primary_GetStarted ">Contact us</button>
                        </div>
                    </div>
                    <div class="socialmedia">
                        <img src="../assets/img/email.png" alt="">
                        <h5>{{email}}</h5>
                    </div>
                    <div class="socialmedia">
                        <img src="../assets/img/location.png" alt="">
                        <h5>{{adress}}</h5>
                    </div>
                    <div class="socialmedia">
                        <img src="../assets/img/telephone.png" alt="">
                        <h5>{{HidePhone ? '********' : phone}}</h5>
                         <button v-if="HidePhone" @click='HidePhone=false' class="Affichebutton">Afiche</button>
                    </div>
                    <div class="socialmedia">
                        <img src="../assets/img/whatsapp.png" alt="">
                        <h5>{{HideWhtsp ? '********' : whatssap}}</h5>
                        <button v-if="HideWhtsp" @click='HideWhtsp=false' class="Affichebutton ">Afiche</button>
                        </div>
                </div>
        </div>
    </div>
</template>


<script>

import myNavbar from '../Components/navbar.vue'
import { VueAgile } from 'vue-agile'
import Connexion from '../Components/connexion.vue'
import Annonce from '../Components/annonce.vue'
import axios from 'axios'
import API_URL from '../../config'
import moment from 'moment'
import Swal from 'sweetalert2'



  export default {
    name: 'HomePage',
    data() {
      return {
			asNavFor1: [],
			asNavFor2: [],
			options1: {
				dots: false,
				fade: true,
				navButtons: false
			},

			options2: {
				autoplay: true,
				centerMode: true,
				dots: false,
				navButtons: false,
				slidesToShow: 3,
				responsive: [
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 5
                    }
                },

                {
                    breakpoint: 1000,
                    settings: {
                        navButtons: true
                    }
                }
            ]

			},

			slides: [],
            OpenConnexion: false,
            OpenAnnonce:false,
            titre:'',
            description:'',
            phone:'',
            whatssap:'',
            adress:'',
            email:'',
            date:'',
            FormName:'',
            FormEmail:'',
            FormPhone:'',
            FormComment:'',
            HidePhone:true,
            HideWhtsp:true
        }
    },
    components:{
        myNavbar,
        VueAgile,
        Connexion,
        Annonce,
    },
    methods:{
        removeAllpopup(){
            this.OpenConnexion= false
            this.OpenAnnonce = false
        },
        GetPostData(){
            console.log(this.$route)
            axios.get(`${API_URL}api/annonce/${this.$route.params.id}`,{headers: {Authorization: 'Bearer ' + localStorage.getItem('token')}})
            .then(res =>{
                const AnnonceImg = res.data.Images
                AnnonceImg.map(element =>{
                    this.slides.unshift(`${API_URL + element.img}`)
                })
                console.log(res.data)
                this.titre=res.data.annonces.titre
                this.date = res.data.annonces.created_at
                this.description = res.data.annonces.description
                this.email = res.data.User[0].email
                this.adress = res.data.annonces.adress
                this.phone = res.data.annonces.télephone
                this.whatssap = res.data.annonces.whatssap
            })
            .catch(err =>{
                console.log(err)
            })
        },
        Convertdate(date){
            const Convert = moment(date).format('MMMM Do YYYY, h:mm:ss a');
            return Convert
        },
        SendEmail(){
            if(this.FormName != '' && this.FormEmail != '' && this.FormPhone !=  '' && this.FormComment != ''){
                const Data={
                    name: this.FormName,
                    email: this.FormEmail,
                    phone: this.FormPhone,
                    comment: this.FormComment
                }
                axios.post(`${API_URL}api/annonce/email`,Data)
                .then(res =>{
                    console.log(res)
                })
                .then(err =>{
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
        }

    },
    mounted(){
        this.GetPostData()
    },


  }
</script>
<style lang="scss" scoped>
    .Affichebutton{
    cursor: pointer;
    padding: 2px 30px;
    border-radius: 100px;
    font-size: 17px;
    font-weight: 600;
    border: 1px solid #fac860;
    font-family: system-ui;
    color: white;
    background-color: #fac860;
    margin: 0px 30px;
                &:hover{
                    color: #fac860;
                    background: transparent;
                }
    }
    .BlackPage{
        background-color: #00000040;
        position: fixed;
        z-index: 100000;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
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
    textarea{
        border: 1px solid #c4c4c4;
        display: flex;
        align-items: center;
        border-radius: 10px;
        padding: 10px 20px;
        margin: 30px 0px;
        width: 100%;
        height: 100px;
        background: white;
    }
            h4{
                text-align: center
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
                            background: white;


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
    .DetailAnnonce{
        margin-top: 140px;
        margin-bottom: 100px;
        padding:0% 18%;
        font-family: system-ui;
        @media screen and (max-width: 1440px) {
                padding:0% 8%;
        }
        .DetailAnnonce_info{
            display: flex;
            align-items:start;
            .simpleinfro ,.infopresonnel{
                background-color:#f9f9f9 ;
                box-shadow: 0px 0px 11px -8px black;
            }
            .simpleinfro{
                width: 60%;
                padding: 40px;
                border-radius:10px;
                h1{
                    font-size:25px;
                    padding-bottom: 10px;
                }
                p{
                    font-size: 17px;
                    line-height:30px;
                    font-weight:900;
                }
                .description{
                    font-size: 16px;
                    line-height:30px;
                    font-weight:300;
                    margin: 20px 0px;
                }

            }
            .infopresonnel{
                width: 38%;
                padding: 20px 40px;
                border-radius:10px;
                margin: 0px auto;
                height:100%;
                .socialmedia{
                    display: flex;
                    align-items: center;
                    margin: 20px 0px;
                }
                img{
                        width: 35px;
                        margin-right: 20px;
                        object-fit: cover;
                }
            }


        }
    }
        .agile .agile__dots{
            display:none
        }
        .agile__nav-button--prev,.agile__nav-button--next{
                border-radius: 100px;
                padding: 4px 7px;
                border: none;
                font-size: 34px;
                font-weight: bolder;
                margin:10px 0px;
                &:hover{
                    background-color:rgb(197, 197, 197);
                    cursor: pointer;
                }
        }
        @media screen and (max-width: 980px) {
                    .DetailAnnonce_info{
                        display:block !important;
                        .simpleinfro,.infopresonnel{
                            width: 100% !important;
                            margin:20px 0px !important;
                        }
                    }
        }

</style>




