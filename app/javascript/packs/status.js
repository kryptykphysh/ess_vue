import Vue from 'vue/dist/vue.esm';
import BootstrapVue from 'bootstrap-vue';
import axios from 'axios';
import { bCard } from 'bootstrap-vue';

Vue.use(BootstrapVue);

import AppNav from '../app_nav.vue';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#status',
    data: {
      statuses: []
    },
    components: { AppNav },
    mounted() {
      axios.get("http://localhost:5000/statuses.json")
        .then(response => { this.statuses = response.data })
    },
    computed: {
      orderedStatuses() {
        return this.statuses.sort((a, b) => a.name - b.name);
      }
    }
  })
})
