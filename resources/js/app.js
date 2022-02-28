import { createApp } from 'vue'
import {createRouter, createWebHistory} from "vue-router";
import App from './App.vue'
import VueAgile from 'vue-agile'
import store from './src/Store'
import axios from 'axios'
import API_URL from './config'


const Home = () => import('./src/views/Home')
const Détails = () => import('./src/views/DétailsAnnonce')
const DashboardAdmine = () => import('./src/views/DashboardAdmin')
const DashboardUser = () => import('./src/views/dashboardUser')
const NotFound = () => import('./src/views/NotFound')

const routes = [
    {
        path: '/',
        component: Home
    },
    {
        path: '/DetailAnnonce/:id',
        component: Détails,
    },
    {
        path: '/DashboardAdmine',
        component: DashboardAdmine,
        beforeEnter: (to, from, next) => {
            const token = localStorage.getItem('token')
            if(token){
                axios.get(`${API_URL}api/user/verefication/LoadData`,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                .then(res =>{
                    res.data.role === "admin" ? next() : next('/')
                })
                .catch(err =>{
                    console.log(err);
                })
            }
            else{
                next('/')
            }
          }
    },
    {
        path: '/DashboardUser',
        component: DashboardUser,
        beforeEnter: (to, from, next) => {
            const token = localStorage.getItem('token')
            if(token){
                axios.get(`${API_URL}api/user/verefication/LoadData`,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
                .then(res =>{
                    res.data.role === "user" ? next() : next('/')
                })
                .catch(err =>{
                    console.log(err);
                })
            }
            else{
                next('/')
            }
          }
    },
    {
        path: "/:catchAll(.*)",
        component: NotFound,
    },
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
})


createApp(App).use(router).use(store).use(VueAgile).mount("#App")
