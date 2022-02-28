<template>
    <div class="HomePage">
        <div v-if="OpenConnexion || OpenAnnonce || OpenSearch" class="BlackPage" @click='removeAllpopup'></div>
        <myNavbar  @connexion='OpenConnexion=true'  @annonce='OpenAnnonce = true'/>
        <myHero @OpenAnnonce='OpenSearch = true'/>
        <myLastAnnonce/>
        <allAnnonce/>
        <Connexion v-if="OpenConnexion" @removePopup='removeAllpopup' />
        <Annonce v-if="OpenAnnonce" @removePopup='removeAllpopup' />
        <SearchPopup  v-if="OpenSearch" />
    </div>
</template>

<script>

import myNavbar from '../Components/navbar.vue'
import myHero from '../Components/hero.vue'
import myLastAnnonce from '../Components/LastAnnonce.vue'
import allAnnonce from '../Components/AllAnnonce.vue'
import Connexion from '../Components/connexion.vue'
import Annonce from '../Components/annonce.vue'
import SearchPopup from '../Components/SearchPopup.vue'


  export default {
    name: 'HomePage',
    data() {
      return {
          OpenConnexion: false,
          OpenAnnonce:false,
          OpenSearch:false
        }
    },
    methods:{
        removeAllpopup(){
            this.OpenConnexion= false
            this.OpenAnnonce = false
            this.OpenSearch = false
        }

    },
    components:{
        myNavbar,
        myHero,
        myLastAnnonce,
        allAnnonce,
        Connexion,
        Annonce,
        SearchPopup
    }

  }
</script>
<style lang="scss" scoped>
    *{
        padding:0;
        margin:0;
        box-sizing:border-box;
    }
    .HomePage{
        padding:0% 18%;
        @media screen and (max-width: 1440px) {
                padding:0% 8%;
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
</style>




