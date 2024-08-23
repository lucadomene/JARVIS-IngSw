<script setup lang="ts">
  import {ref, onMounted, watch} from 'vue';
  const isDarkThemeChecked = ref(false);

  const detectSystemTheme = () => {
    const prefersDarkScheme = window.matchMedia("(prefers-color-scheme: dark)");
    isDarkThemeChecked.value = prefersDarkScheme.matches;
  };

  onMounted(() => {
    detectSystemTheme();
    window.matchMedia("(prefers-color-scheme: dark)").addEventListener('change', detectSystemTheme);
  });

  watch(isDarkThemeChecked, (newVal) => {
    if (newVal) {
      document.documentElement.setAttribute('data-theme', 'dark');
    } else {
      document.documentElement.setAttribute('data-theme', 'light');
    }
  });
</script>

<template>
  <nav role="navigation">
    <ul>
      <li class="stayactive">
        <router-link to="/" active-class="active-link">Nuova prenotazione</router-link>
      </li>
      <li class="stayactive">
        <router-link to="/bookings" active-class="active-link">Prenotazioni effettuate</router-link>
      </li>
      <li>
        <label for="theme-toggle" :class="['theme-button-switch', {'active': isDarkThemeChecked}]">
          <input type="checkbox" id="theme-toggle" class="theme-button" v-model="isDarkThemeChecked">
          <span :class="['theme-button-inner', {'active': isDarkThemeChecked}]">

          </span>
          <span class="animateBg"/>
        </label>
      </li>
    </ul>
  </nav>
</template>

<style scoped>
  nav ul {
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    padding:0;
    margin:0;
    background-color: var(--navbar-bg);
    width: 100%;
    box-shadow: 0 2px 10px var(--highlight-color);
    animation: fade-down 0.3s;
  }

  nav ul li{
    display: flex;
    align-items: center;
    justify-content: center;
  }

  nav ul:hover{
    box-shadow: 0 2px 20px var(--highlight-color);
    transition: .2s;
  }

  nav ul li a {
    display: block;
    padding:10px 20px;
    color: var(--navbar-text-color);
  }

  label{
    display: flex;
    align-items: center;
  }

  .stayactive:active {
    transform: translateY(2px);
  }

  .stayactive:hover {
    background-color: var(--highlight-button-hover);
  }

  nav ul li:hover > ul {
    display: block;
  }

  .theme-button {
    display: none;
  }

  .theme-button-switch {
    --theme-button-width: 75px;
    align-items: center;
    width: var(--theme-button-width);
    height: 30px;
    padding:10px;
    cursor: pointer;
    border-radius: 50px;
    user-select: none;
    transition: background-color 0.3s;
    box-shadow: 0 8px 40px hsla(0, 0%, 0%, .2);
    background-color: var(--theme-button-bg-color);
  }

  .theme-button-switch .theme-button-inner{
    display: block;
    position: relative;
    width: 25px;
    height: 25px;
    background-color: var(--theme-button-inner-color);
    border-radius: 50%;
    transition: all 0.6s;
  }

  .theme-button-switch .theme-button-inner::before{
    content: "";
    position: absolute;
    top: 0;
    left:-30%;
    width: 100%;
    height: 100%;
    background-color: var(--theme-button-bg-color);
    border-radius: 50%;
    transform: scale(0);
    transition: all 0.6s;
  }

  .theme-button-switch .theme-button-inner.active{
    transform: translateX(calc(var(--theme-button-width) - 44px));
  }

  .theme-button-switch .theme-button-inner.active:before{
    left: -12px;
    transform: scale(1);
  }

  @media(min-width: 576px){
    nav ul{
      flex-direction: row;
    }
  }
  @media(max-width: 576px){
    nav ul{
      flex-direction: column;
    }
  }
</style>