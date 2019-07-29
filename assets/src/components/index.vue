<template>
  <v-container
    fluid
    grid-list-sm
  >
    <v-layout wrap>
      <v-flex
        v-for="i in items"
        :key="i"
        xs12
        md4
      >
        <v-img
          :src="i.thumbnail"
          :lazy-src="i.thumbnail"
          aspect-ratio="1"
        ></v-img>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
    items: [],
  }),
  created() {
    this.getCameras()
  },
  methods: {
    getCameras() {
      let myitems = []
      let api_id = this.$root.user.api_id
      let api_key = this.$root.user.api_key
      axios.get('https://media.evercam.io/v2/cameras',{
        params: {
          api_id: api_id,
          api_key: api_key
        }
      })
      .then(function (response) {
        // handle success
        let aux = response.data.cameras
        aux.forEach(function (arrayItem) {
          myitems.push({
            thumbnail: arrayItem.thumbnail_url + '?api_id=' + api_id + '&api_key=' + api_key,
            title: arrayItem.name,
            to: '/camera/' + arrayItem.id
          })
        });
      })
      .catch(function (error) {
        // handle error
        console.log(error);
      });
      this.items = myitems
    },
  }
};
</script>
