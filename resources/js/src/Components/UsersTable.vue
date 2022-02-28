<template>
    <div class="Tables">
        <div class="TableHeader">
                <h5 v-for="Item,n in TableHeader" :key="n">{{Item}}</h5>
                <h5>Action</h5>
        </div>
        <div class="bodyTableZone">
            <div class="TableHBody" v-for="Item,n in TableBody" :key="n" :style="n%2==0 ? 'background:#dddddd' : 'background:#c8c8c8'">
                        <h5>{{Item.name}}</h5>
                        <h5>{{Item.prénome}}</h5>
                        <h5>{{Item.age}}</h5>
                        <h5>{{Item.email}}</h5>
                        <h5>{{Item.raisonsocial}}</h5>
                    <h5>
                        <img @click='RemoveUser(Item.id)' src="../assets/img/delete.png" alt="" />
                    </h5>
            </div>
        </div>

    </div>
</template>

<script>

import axios from 'axios'
import Swal from 'sweetalert2'

  export default {
    name: 'AdmineDahboard',
    data() {
      return {
            TableHeader:['Nom','Prénom','Age','Email','Raison social'],
            TableBody:[],
        }
    },
    methods:{
        RemoveUser(id){
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
                    axios.delete(`api/user/${id}`,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                    .then(res =>{
                        console.log(res)
                        const newArr = this.TableBody.filter(Row => Row.id !== id);
                        this.TableBody = newArr
                        Swal.fire(
                            'Deleted!',
                            'user has been deleted.',
                            'success'
                        )
                    })
                    .catch(err =>{
                        console.log(err)
                    })
                }
            })
        },
        getAllAnnonce(){
                axios.get('api/user',{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                .then(res =>{
                    this.TableBody = res.data.user
                })
                .catch(err =>{
                    console.log(err)
                })
        },
    },
    components:{
    },
    mounted(){
        this.getAllAnnonce()
    }

  }
</script>
<style lang="scss" scoped>
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


</style>




