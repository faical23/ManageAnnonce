import { createApp } from 'vue'
import {createRouter, createWebHistory} from "vue-router";
import App from './App.vue'

const Home = () => import('./src/views/Home')
const Détails = () => import('./src/views/DétailsAnnonce')
const DashboardAdmine = () => import('./src/views/DashboardAdmin')
const DashboardUser = () => import('./src/views/dashboardUser')

const routes = [
    {
        path: '/home',
        component: Home
    },
    {
        path: '/Details/:id',
        component: Détails
    },
    {
        path: '/DashboardAdmine',
        component: DashboardAdmine
    },
    {
        path: '/DashboardUser',
        component: DashboardUser
    },
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
})


createApp(App).use(router).mount("#App")
