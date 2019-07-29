<template>
  <v-app>
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      :fixed="fixed"
      id="style-1"
      app
    >
      <v-list>
        <v-list-group
          value="true"
        >
          <template v-slot:activator>
            <v-list-item-icon>
              <font-awesome-icon icon="video"/>
            </v-list-item-icon>
            <v-list-item-title>Cameras</v-list-item-title>
          </template>
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
            :to="item.to"
            link
          >
            <v-list-item-icon>
              <font-awesome-icon icon="video"/>
            </v-list-item-icon>
            <v-list-tile-content>
              <v-list-tile-title v-text="item.title" />
            </v-list-tile-content>
          </v-list-item>
        </v-list-group>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Add IP Camera</v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Snapmail</v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Archives</v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Map View</v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Status Report</v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Settings</v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Live Support</v-list-item-title>
        </v-list-item>

        <v-list-item
          href="/users/sign_out"
          link
        >
          <v-list-item-icon>
            <font-awesome-icon icon="video"/>
          </v-list-item-icon>

          <v-list-item-title>Sign out</v-list-item-title>
        </v-list-item>
      </v-list>
      <template v-slot:append>
        <div class="pa-0 float-right">
          <v-btn
            icon
            right
            @click.stop="miniVariant = !miniVariant"
          >
            <font-awesome-icon icon="chevron-right" />
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
    <v-content>
      <router-view/>
    </v-content>
  </v-app>
</template>

<style scoped>
  #style-1::-webkit-scrollbar {
    width: 6px;
    background-color: #F5F5F5;
  }
  #style-1::-webkit-scrollbar-thumb {
    background-color: #F90;
    background-image: -webkit-linear-gradient(90deg, rgba(255, 255, 255, .2) 25%,
                        transparent 25%,
                        transparent 50%,
                        rgba(255, 255, 255, .2) 50%,
                        rgba(255, 255, 255, .2) 75%,
                        transparent 75%,
                        transparent)
  }
  #style-1::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
  }
</style>

<script>
import axios from 'axios'

export default {
  name: 'App',
  data: () => ({
    clipped: true,
    drawer: true,
    fixed: true,
    items: [],
    miniVariant: false,
    right: true,
    rightDrawer: false,
    title: 'Evercam'
  }),
  created() {
    this.$vuetify.theme.dark = true
    this.getCameras()
  },
  methods: {
    getCameras() {
      let myitems = []
      axios.get(process.env.VUE_APP_API_URL + 'cameras',{
        params: {
          api_id: this.$root.user.api_id,
          api_key: this.$root.user.api_key
        }
      })
      .then(function (response) {
        // handle success
        let aux = response.data.cameras
        aux.forEach(function (arrayItem) {
          myitems.push({
            icon: 'videocam',
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
