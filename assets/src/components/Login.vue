<template>
  <v-app id="login2">
    <v-content>
      <v-container fluid fill-height>
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12">
              <v-toolbar dark color="primary">
                <v-toolbar-title>Login form</v-toolbar-title>
              </v-toolbar>
              <v-form method="post" action="/users/sign_in" id="nativeForm">
                <v-card-text>
                  <input type="hidden" name="_csrf_token" :value="csrf"></input>
                  <font-awesome-icon icon="user" /><v-text-field v-model="formUsername" name="email" label="Email" type="text"></v-text-field>
                  <font-awesome-icon icon="lock" /><v-text-field v-model="formPassword" id="password" name="password" label="Password" type="password"></v-text-field>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="primary" @click="login">Login</v-btn>
                </v-card-actions>
              </v-form>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Login',
  data: () => ({
    formUsername: '',
    formPassword: '',
    csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }),
  created () {
    this.$vuetify.theme.dark = true
  },
  methods: {
    // login () {
    //   axios.post('/users/sign_in', {
    //     _csrf_token: this.csrf,
    //     email: this.formUsername,
    //     password: this.formPassword
    //   })
    // }
    login () {
      nativeForm.submit()
    }
  }
};
</script>
