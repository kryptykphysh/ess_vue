import Vue from 'vue/dist/vue.esm';
import BootstrapVue from 'bootstrap-vue';
import axios from 'axios';
import { bCard } from 'bootstrap-vue';

Vue.use(BootstrapVue);

import AppNav from '../app_nav.vue';
import App from '../app.vue';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#dashboard',
    data: {
      machines: []
    },
    components: { AppNav },
    mounted() {
      axios.get("http://localhost:5000/machines.json")
        .then(response => { this.machines = response.data })
    }
  })
})
