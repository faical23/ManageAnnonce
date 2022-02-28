import { createStore } from 'vuex'
import axios from "axios";

export default createStore({
  state: {
    authenticated: false,
    user : null,
    tokenAccess : null,
  },
  mutations: {
    setAuth(state,userData){
        state.authenticated = true; // ==> make authenricated true
        state.user = userData.user;  // ==> store user data in our user state
        localStorage.setItem('token', userData.token) // => store token in localstorage
        state.tokenAccess = userData.token /// store token in our token state
      },
    initialiseAuth(state,User){
        state.authenticated = true;
        state.user = User.data
        state.tokenAccess = localStorage.getItem('token')
    },
    initialiseLogout(state){
        state.authenticated = false
        state.user =  null
        state.tokenAccess = null
    },

  },
  actions: {
    loadData :function ({commit}){
        axios.get(`api/user/verefication/LoadData`,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
        .then(res =>{
            commit('initialiseAuth', res)
        })
        .catch(err =>{
            console.log(err);
        })
    },
    logout: function ({commit}){
        axios.get(`auth/login`,{ headers: { Authorization: 'Bearer ' + localStorage.getItem('token')}})
        .then(res =>{
            commit('initialiseLogout')
            localStorage.clear()
        })
        .catch(err =>{
            console.log(err);
        })
  },
  },

})
