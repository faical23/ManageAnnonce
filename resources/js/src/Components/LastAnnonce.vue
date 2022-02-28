<template>
    <div class="LastAnnonce">
        <h2>Our last 4 announcement</h2>
        <div class="LastAnnonce_card">
            <myCard v-for="item,n in AllAnnonce" :key="n" :item='item' />
        </div>
    </div>
</template>

<script>

import myCard from './card.vue'
import axios from 'axios';
  export default {
    name: 'LastAnnonce',
    data() {
      return {
          AllAnnonce:[]
        }
    },
    methods:{
        GetAnnonce(){
            axios.get('/api/annonce/lastfor/4')
            .then(res=>{
                this.AllAnnonce = res.data.annonces
            })
            .catch(err=>{
                console.log(err)
            })
        }
    },
    mounted(){
        this.GetAnnonce()
    },
    components:{
        myCard
    }

  }
</script>
<style lang="scss" scoped>
    .LastAnnonce{
        font-family: system-ui;
        margin: 40px 0px;
        .LastAnnonce_card{
              display: grid;
              grid-gap: 1rem;
                grid-template-columns: repeat(
                    auto-fit,
                    minmax(200px, 1fr)
                );
             @media screen and (max-width: 1440px) {
                grid-template-columns: repeat(
                    auto-fit,
                    minmax(260px, 1fr)
                );
            }
        }
    }
</style>




