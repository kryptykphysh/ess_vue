import Vue from 'vue/dist/vue.esm';
import BootstrapVue from 'bootstrap-vue';
import axios from 'axios';
import { bCard } from 'bootstrap-vue';

Vue.use(BootstrapVue);

import AppNav from '../app_nav.vue';

document.addEventListener('DOMContentLoaded', () => {
  console.log(App);
  const app = new Vue({
    el: '#dashboard',
    data: {
      machines: []
    },
    components: { AppNav },
    mounted() {
      axios.get("http://localhost:5000/machines.json")
        .then(response => { this.machines = response.data });
    },
    computed: {
      orderedMachines() {
        return this.machines.sort((a, b) => a.name - b.name);
      }
    },
    methods: {
      sendMessage() {
        App.message.send_message('Clicked!');
      }
    }
  })
})
