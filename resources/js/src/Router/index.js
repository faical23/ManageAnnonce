
import {createRouter, createWebHistory} from "vue-router";

const Home = () => import('./src/views/Home')
const Détails = () => import('./src/views/DétailsAnnonce')
const DashboardAdmine = () => import('./src/views/DashboardAdmin')
const DashboardUser = () => import('./src/views/dashboardUser')

const routes = [
    {
        path: '/',
        component: Home
    },
    {
        path: '/Détails/:id',
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

  export default router

