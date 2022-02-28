<template>
<div class="Dashboard">

    <div class="SideBare">
        <h1>Dashboard</h1>
        <ul>
            <router-link to="/" >
                <li>
                   <img src="../assets/img/home.png" alt="" />Back to home
                </li>
             </router-link>
                <li v-if="this.$store.state.user?.role === 'admin'" @Click="Type= 'Users',TableTitre='Our Users'"><img src="../assets/img/group.png" alt="" />Users</li>
                <li @Click="Type = 'Annonce',TableTitre='Our announcements'"><img  src="../assets/img/megaphone.png" alt="" />announcements</li>
        </ul>
        <li @click='Logout()'><img src="../assets/img/logout.png" alt="" />Logout</li>
    </div>
    <div class="Content">
            <div className="Dashborad__Haeder">
                    <h3>{{this.$store.state.user?.name +' '+ this.$store.state.user?.prénome}}</h3>
                    <h5>{{ConverTime()}}</h5>
            </div>
            <div  className="Dashboard__Centent__Tables">
                <h1>{{TableTitre}}</h1>
                <div class="DataTable">
                    <MyUsersTable v-if="this.$store.state.user?.role == 'admin' && Type === 'Users'" />
                    <MyAnnonceTable v-if="this.$store.state.user?.role == 'user' || Type === 'Annonce'" />
                </div>
            </div>
    </div>
</div>

</template>

<script>

import MyUsersTable from './UsersTable.vue'
import MyAnnonceTable from './AnnonceTables.vue'
import moment from 'moment'


  export default {
    name: 'AdmineDahboard',
    data() {
      return {
          TableTitre:'Our Users',
          Type:"Users",
        }
    },
    methods:{
        CheckWhoIsLogin(){
            this.$store.state?.user?.role === 'user' && (this.TableTitre = "Our announcements")
        },
        GetUserData(){
        },
        GetAnnonceData(){
        },
        Logout(){
            this.$router.push('/')
            this.$store.dispatch('logout')
        },
        ConverTime(){
            const Convert = moment(new Date()).format("MMM Do YY");
            return Convert
        },
    },
    mounted(){
        this.CheckWhoIsLogin()
    },
    components:{
        MyUsersTable,
        MyAnnonceTable,
        moment
    }

  }
</script>
<style lang="scss" scoped>

.Dashboard{
    display: flex;
    align-items: start;
    justify-content: space-between;
}
.SideBare{
    border-radius:20px;
    width:20%;
    height:92vh;
    background-color:#ebebeb;
    box-shadow:0px 0px 11px -6px black;
    display: flex;
    flex-direction:column;
    margin-right: 30px;
    font-family: system-ui;
    h1{
        font-weight: bolder;
        font-size:30px;
        line-height:80px;
        width: 100%;
        text-align: center;
        margin-bottom: 50px;
        color: rgb(32, 32, 32);
        padding:30px;
    }
    ul{
        height:100%;
    }
    li{
        padding:17px;
        border-radius:10px;
        font-weight: bolder;
        font-size:20px;
        width: 100%;
        color: rgb(32, 32, 32);
        cursor: pointer;
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        a{
            text-decoration: none;
            color: black;
        }
        img{
            width: 25px;
            margin-right:10px;
        }
        &:hover{
            background-color:rgb(32, 32, 32);
            color: white;
            a{
                color: white;
            }
        }
    }
}
.Content{
width:100%;
.Dashborad__Haeder{
    border-radius:10px;
    background-color:#ebebeb;
    box-shadow:0px 0px 11px -6px black;
    display: flex;
    align-items: center;
    padding:5px 20px;
    justify-content: space-between;
    img{
        width:30px;
    }
    h5{
        padding:17px;
        border-radius:10px;
        font-weight: bolder;
        font-size:20px;
        color: rgb(32, 32, 32);
    }
}
.Dashboard__Centent__Tables{
    border-radius:10px;
    background-color:#ebebeb;
    box-shadow:0px 0px 11px -6px black;
    padding:20px;
    width:100%;
    margin-top: 30px;
}
}

</style>




