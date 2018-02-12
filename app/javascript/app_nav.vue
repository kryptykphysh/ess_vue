<template>
  <div id="app-nav">
      <b-navbar toggleable="md" type="dark" variant="info">
          <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
          <b-navbar-brand href="#">ESS</b-navbar-brand>
          <b-collapse is-nav id="nav_collapse">
              <b-navbar-nav>
                  <b-nav-item href="/" :active="activeLink == 'dashboard'">Dashboard</b-nav-item>
              </b-navbar-nav>
          </b-collapse>
      </b-navbar>
  </div>
</template>

<script>
import bNavbar from 'bootstrap-vue/es/components/navbar/navbar';
console.log('IMport run');
export default {
  data: function () {
      return {
          foo: "bar"
      }
  },
  props: ['activeLink'],
  components: { bNavbar }
}
console.log('Header loaded');
</script>

<style scoped>
</style>
