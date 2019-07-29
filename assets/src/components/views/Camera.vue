<template>
  <v-tabs>
    <v-tab
      :href="'#liveView'"
    >
      Live View
    </v-tab>
    <v-tab
      :href="'#recordings'"
    >
      Recordings
    </v-tab>
    <v-tab
      :href="'#sharing'"
    >
      Sharing
    </v-tab>
    <v-tab
      :href="'#details'"
    >
      Details
    </v-tab>
    <v-tab
      :href="'#archives'"
    >
      Archives
    </v-tab>
    <v-tab
      :href="'#snapmail'"
    >
      Snapmail
    </v-tab>
    <v-tab
      :href="'#compare'"
    >
      Compare
    </v-tab>
    <v-tab-item
      :value="'liveView'"
    >
      <LiveView />
    </v-tab-item>
    <v-tab-item
      :value="'recordings'"
    >
      <LiveView />
    </v-tab-item>
    <v-tab-item
      :value="'sharing'"
    >
      <LiveView />
    </v-tab-item>
    <v-tab-item
      :value="'details'"
    >
      <LiveView />
    </v-tab-item>
    <v-tab-item
      :value="'archives'"
    >
      <LiveView />
    </v-tab-item>
    <v-tab-item
      :value="'snapmail'"
    >
      <LiveView />
    </v-tab-item>
    <v-tab-item
      :value="'compare'"
    >
      <LiveView />
    </v-tab-item>
  </v-tabs>
</template>

<script>
import LiveView from '../Liveview';

export default {
  components: {
    LiveView,
  },
};
</script>
