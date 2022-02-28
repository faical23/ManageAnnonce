<template>
    <router-link :to="'/DetailAnnonce/'+item?.id" >
        <div class="Card">
            <img :src="CoverImg" alt="">
            <div class="Card_info">
                <h3>{{item?.titre.slice(0,17)}} ...</h3>
                <p>{{item?.description.slice(0,100)}}...</p>
                <div class="Card_info_phone">
                    <span class="Phone">{{item?.télephone}}</span>
                    <span class="adress">{{item?.adress.slice(0,18)}}</span>
                </div>
            </div>
        </div>
    </router-link>
</template>

<script>
import API_URL from '../../config'

import axios from 'axios'
  export default {
    name: 'myCard',
    props:['item'],
    data() {
      return {
          CoverImg: ''
        }
    },
    methods:{
        GetThisAnnonce(){
            axios.get(`api/annonce/${this.item?.id}`)
            .then(res=>{
                this.CoverImg = `${API_URL}${res.data.Images[0].img}`
            })
            .catch(err=>{
                console.log(err)
            })
        }
    },
    components:{

    },
    mounted(){
        this.GetThisAnnonce()
    }

  }
</script>
<style lang="scss" scoped>
    a{
        text-decoration:none
    }
    .Card{
        font-family: system-ui;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0px 0px 11px -6px black;
        margin: 30px 0px;
        width:280px;
        cursor: pointer;
        color: black !important;
        img{
            width: 100%;
            height: 300px;
            object-fit: contain;
        }
        .Card_info{
            padding:20px;
            h3{
                padding: 0px;
                margin: 0px;
                padding-bottom:10px;
                font-size: 20px;
            }
            p{
                font-size: 16px;
            }
            .Card_info_phone{
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin: 20px 0px;
                .Phone{
                    background-color: #fac860;
                    padding: 5px 10px;
                    border-radius: 8px;
                    font-weight: 700;
                    color: white;
                }
                .adress{
                    font-size:12px;

                }

            }
        }
    }
</style>




