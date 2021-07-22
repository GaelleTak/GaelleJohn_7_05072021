
<template>
  <header>
    <h1>
      <img class="img-fluid" alt="Groupomania" src="../assets/logo.svg" />
    </h1>
    <nav>
      <router-link to="/">Connexion</router-link> |
      <router-link to="/Signup">Inscription</router-link>
    </nav>
  </header>
</template>

<script>
export default {
  name: "NavLogin",
};
</script>

<style scoped lang="scss">
header {
  margin-top: 10em;
}
</style>