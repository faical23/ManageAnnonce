<template>
    <header>
        <h1 class="logo">
            <router-link to="/" class="LogoTtext">
                My annonce
            </router-link>
        </h1>
        <input type="checkbox" id="nav-toggle" class="nav-toggle">
  <nav>
    <ul>
        <router-link :to="this.$store.state?.user?.role === 'user' ? '/DashboardUser' : '/DashboardAdmine'" v-if="this.$store.state?.authenticated" >
            <button class="connexion">Dashboard</button>
        </router-link>
        <button class="connexion" @click="$emit('connexion')"  v-else>Connexion</button>
        <button class="create" @click.prevent="MakeEmitToAnnonce()">create annonce</button>
    </ul>
  </nav>
  <label for="nav-toggle" class="nav-toggle-label">
    <span></span>
  </label>
</header>
</template>

<script>
import Swal from 'sweetalert2'

  export default {

    name:'connexion',
    emits:['connexion','annonce'],
    data() {
      return {

        }
    },
    methods:{
        MakeEmitToAnnonce(){
            if(!this.$store.state.authenticated){
                Swal.fire({
                    position: 'center-center',
                    icon: 'error',
                    title: 'Your are not connect please make sur you are connected',
                    showConfirmButton: false,
                    timer: 3500
                })
            }
            else{
                this.$emit('annonce')
            }

        },
    },

  }
</script>

<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');

:root {
  --background: rgba(0, 214, 170, .85);
}

*, *::before, *::after {
  box-sizing: border-box;
}
    a{
        text-decoration: none !important;
    }



body {
	margin: 0;
	background: #222;
	font-family: 'Work Sans', sans-serif;
	font-weight: 400;
}

.content {
  height: 200vh;
  background-image: url(//unsplash.it/1000/1000);
  background-color: #333;
  background-blend-mode: multiply;
  background-size: cover;
  display: grid;
  place-items: center;
}

.connexion {
    color: #fac860;
    background: transparent;
    &:hover{
        color: white;
        background-color: #fac860;
    }

}
.create{
    color: white;
    background-color: #fac860;
    &:hover{
        color: #fac860;
        background: transparent;
    }

}
.create,.connexion{
    cursor: pointer;
    padding: 10px 30px;
    border-radius: 100px;
    font-size: 17px;
    font-weight: 600;
    border: 1px solid #fac860;
    margin:0px 20px;
    margin-bottom: 20px;
    font-family: system-ui;
}

/* navigation styles start here */

header {
  background: #f9f9f9;
  text-align: center;
  position: fixed;
  z-index: 999;
  width: 100%;
    top: 0;
    left: 0;
    align-items: baseline;
    padding: 20px 0px 10px 0px;
                    font-family: system-ui;
}

/* changed this from the tutorial video to
   allow it to gain focus, making it tabbable */
.nav-toggle {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.nav-toggle:focus ~ .nav-toggle-label {
  outline: 3px solid rgba(lightblue, .75);
}

.nav-toggle-label {
  position: absolute;
  top: 0;
  left: 0;
  margin-left: 1em;
  height: 100%;
  display: flex;
  align-items: center;
}

.nav-toggle-label span,
.nav-toggle-label span::before,
.nav-toggle-label span::after {
    display: block;
    background: black;
    height: 7px;
    width: 3em;
    border-radius: 4px;
    position: relative;
    margin: 6px 0px;
}

.nav-toggle-label span::before,
.nav-toggle-label span::after {
  content: '';
  position: absolute;
}

.nav-toggle-label span::before {
  bottom: 7px;
}

.nav-toggle-label span::after {
  top: 7px;
}

nav {
  position: absolute;
  text-align: left;
  top: 100%;
  left: 0;
  background: var(--background);
  width: 100%;
  transform: scale(1, 0);
  transform-origin: top;
  transition: transform 400ms ease-in-out;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
  text-align: center;
}

nav li {
  margin-bottom: 1em;
  margin-left: 1em;
}

nav a {
  color: black;
  text-decoration: none;
  font-size: 1.2rem;
  text-transform: uppercase;
  opacity: 0;
  transition: opacity 150ms ease-in-out;
}

nav a:hover {
  color: #000;
}

.nav-toggle:checked ~ nav {
  transform: scale(1,1);
}

.nav-toggle:checked ~ nav a {
  opacity: 1;
  transition: opacity 250ms ease-in-out 250ms;
}
.LogoTtext a{
        font-family: 'Permanent Marker', cursive !important;
        color: #fac860 !important;

}
.LogoTtext{
    font-family: 'Permanent Marker', cursive !important;
    color: #fac860 !important;
}

@media screen and (min-width: 800px) {
  .nav-toggle-label {
    display: none;
  }

  header {
    display: grid;
    grid-template-columns: 1fr auto minmax(600px, 3fr) 1fr;
  }

.LogoTtext a{
        font-family: 'Permanent Marker', cursive !important;
        color: #fac860 !important;

}
  .logo {
    grid-column: 2 / 3;
  }

  nav {
    // all: unset; /* this causes issues with Edge, since it's unsupported */

    /* the following lines are not from my video, but add Edge support */
    position: relative;
    text-align: left;
    transition: none;
    transform: scale(1,1);
    background: none;
    top: initial;
    left: initial;
    /* end Edge support stuff */

    grid-column: 3 / 4;
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }

  nav ul {
    display: flex;
  }

  nav li {
    margin-left: 3em;
    margin-bottom: 0;
  }

  nav a {
    opacity: 1;
    position: relative;
  }


}


</style>
