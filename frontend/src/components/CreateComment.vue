
<template>
  <form name="formComment">
    <textarea
      name="comment"
      class="form-control"
      cols="130"
      rows="2"
      required
      placeholder="Créer un commentaire"
      aria-label="Ecrire un commentaire"
      v-model="body"
      v-on:input="sendComment"
    ></textarea>
    <slot></slot>
  </form>
</template>

<script>
export default {
  name: "CreateComment",
  data: () => {
    return {
      body: "",
    };
  },
  methods: {
    sendComment() { 
      this.$emit("comment-sent", this.$data);
    },
  },
};
</script>