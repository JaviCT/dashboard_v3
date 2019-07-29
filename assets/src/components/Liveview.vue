<template>
  <v-layout align-center justify-center>
    <v-img
      :src="url"
      :lazy-src="url"
      class="grey lighten-2"
      width="100%"
    ></v-img>
    <div class="text-xs-center buttons">
      <v-btn
        dark
        fab
        small
        color="rgba(0, 0, 0, 0.65)"
        v-if="!isPlaying"
      >
        <font-awesome-icon icon="play"/>
      </v-btn>
      <v-btn
        dark
        fab
        small
        color="rgba(0, 0, 0, 0.65)"
        v-else
      >
        <font-awesome-icon icon="pause"/>
      </v-btn>
      <v-btn
        dark
        fab
        small
        color="rgba(0, 0, 0, 0.65)"
      >
        <font-awesome-icon icon="search"/>
      </v-btn>
      <v-btn
        dark
        fab
        small
        color="rgba(0, 0, 0, 0.65)"
      >
        <font-awesome-icon icon="download"/>
      </v-btn>
      <v-btn
        dark
        fab
        small
        color="rgba(0, 0, 0, 0.65)"
      >
        <font-awesome-icon icon="pencil-alt"/>
      </v-btn>
      <v-btn
        dark
        fab
        small
        color="rgba(0, 0, 0, 0.65)"
      >
        <font-awesome-icon icon="expand-arrows-alt"/>
      </v-btn>
    </div>
  </v-layout>
</template>

<style scope>
.buttons{
  position: absolute;
}
.button {
  opacity: 0.5;
}
</style>

<script>
import axios from 'axios'
import io from 'socket.io-client'
import { Socket} from 'phoenix-socket'

export default {
  data: () => ({
    isPlaying: false,
    url: ""
  }),
  mounted() {
    let socket = new Socket('wss://media.evercam.io/socket', {params: {api_id: this.$root.user.api_id, api_key: this.$root.user.api_key, ip: '1.1.1.1', source: "private_widget"}})
    socket.connect()
    this.channel = socket.channel("cameras:" + this.$route.params.id, {})
    this.channel.join()
    this.channel.on('snapshot-taken', (data) => {
      this.url = 'data:image/jpeg;base64,' + data.image
    });
  },
  methods: {
    getCamera() {
      let myCamera = null
      let api_id = this.$root.user.api_id
      let api_key = this.$root.user.api_key
      let camera = thsi.$route.params.id
      axios.get(process.env.VUE_APP_API_URL + 'cameras/' + camera,{
        params: {
          api_id: api_id,
          api_key: api_key
        }
      })
      .then(function (response) {
        // handle success
        let myCamera = response.data.cameras
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
      this.camera = myitems
    }
  }
};
</script>
