<template>

<div>
        <div v-if="OpenAnnonce" class="BlackPage" @click='removeAllpopup'></div>
        <annonce v-if="OpenAnnonce" @removePopup='removeAllpopup'/>
        <div class="Tables">

        <button v-if="this.$store.state?.user?.role === 'user'"  class="create" @click='OpenAnnonce = true'>Create annonce</button>
        <div class="TableHeader">
                <h5 v-for="Item,n in TableHeader" :key="n">{{Item}}</h5>
                <h5>Action</h5>
        </div>
        <div class="bodyTableZone">
            <div class="TableHBody" v-for="Item,n in TableBody" :key="n" :style="n%2==0 ? 'background:#dddddd' : 'background:#c8c8c8'">
                        <h5>{{Item.titre.slice(0,10)}}...</h5>
                        <h5>{{Item.télephone}}</h5>
                        <h5>{{Item.whatssap}}</h5>
                        <h5>{{Item.created_at.slice(0,10)}}</h5>
                        <h5 @click='ApproveAnnonce(Item.id,n)' class="btnValide"  v-if="Item.isApprove == 1">Valide</h5>
                        <h5 @click='ApproveAnnonce(Item.id,n)' class="btnInvallide" v-if="Item.isApprove == 0">Invalide</h5>
                    <h5>
                        <img @click='SwitchtoDétails(Item.id)' src="../assets/img/eye.png" alt="" />
                        <img @click='Delete(Item.id)' v-if="this.$store.state?.user?.role === 'user'" src="../assets/img/delete.png" alt="" />
                    </h5>
            </div>
        </div>
    </div>
    </div>
</template>

<script>
import annonce from './annonce.vue'
import axios from 'axios'
import Swal from 'sweetalert2'



  export default {
    name: 'AdmineDahboard',
    data() {
      return {
            TableHeader:['Titre','Telephone','Whatssap','Create','State'],
            TableBody:[],
            OpenAnnonce:false
        }
    },
    methods:{
        removeAllpopup(){
            this.OpenAnnonce = false
            this.getAllAnnonce();
        },
        getAllAnnonce(){
            const userid = this.$store.state?.user?.id
            let Api = ''
            this.$store.state?.user?.role === 'user' ? (Api = `api/annonce/user/${userid}`) : (Api = 'api/annonce/admin/dashboard')

                axios.get(Api,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                .then(res =>{
                    this.TableBody = res.data.annonces
                    console.log(res)
                })
                .catch(err =>{
                    console.log(err)
                })
        },
        SwitchtoDétails(id){
            this.$router.push(`/DetailAnnonce/${id}`)
        },
        Delete(id){
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                if (result.isConfirmed) {
                    axios.delete(`api/annonce/${id}`,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                    .then(res =>{
                        console.log(res)
                        const newArr = this.TableBody.filter(Row => Row.id !== id);
                        this.TableBody = newArr
                        Swal.fire(
                            'Deleted!',
                            'Your annonce has been deleted.',
                            'success'
                        )
                    })
                    .catch(err =>{
                        console.log(err)
                    })
                }
            })
            console.log(id)
        },
        ApproveAnnonce(id,index){
            if(this.$store.state?.user?.role == "admin"){
                console.log(id,index)
                    axios.put(`api/annonce/approve/${id}`,{},{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                    .then(res =>{
                        this.TableBody[index].isApprove == 0 ? this.TableBody[index].isApprove = 1 : this.TableBody[index].isApprove = 0
                                                Swal.fire({
                                                    position: 'top-right',
                                                    icon: 'success',
                                                    title: 'succès changement status',
                                                    showConfirmButton: false,
                                                    timer: 2000
                                                })
                    })
                    .catch(err =>{
                        console.log(err)
                    })
            }
        }
    },
    components:{
        annonce
    },
    mounted(){
        this.getAllAnnonce()
    }

  }
</script>
<style lang="scss" scoped>
    .BlackPage{
        background-color: #00000040;
        position: fixed;
        z-index: 100000;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
    }
.btnValide,.btnInvallide{
    border-radius: 4px;
    color:white;
    cursor: pointer;
}
.btnInvallide{
    background: red;
}
.btnValide{
    background:green !important;
}
    .Tables{
        margin: 30px 0px;
        .bodyTableZone{
            height:550px;
            overflow-y: scroll;
        }
        .TableHeader,.TableHBody{
            display: flex;
            align-content: center;
            width: 100%;
            padding: 14px 18px;
            border-radius: 10px;
            justify-content: space-between;
            margin-bottom:10px;
            text-align: center;
            h5{
                width: 100px;
                font-size: 15px;
            }
            img{
                width: 20px;
                cursor: pointer;
                margin: 0px 4px
            }
            .email{
                width: 150px;
            }
        }
        .idTags,.isApproveTags{
            display:none;
        }
    }
.create{
    color: white;
    background-color: #fac860;
        cursor: pointer;
    padding: 10px 30px;
    border-radius: 100px;
    font-size: 17px;
    font-weight: 600;
    border: 1px solid #fac860;
    margin:0px 20px;
    margin-bottom: 20px;
    font-family: system-ui;
    &:hover{
        color: #fac860;
        background: transparent;
    }

}

</style>




