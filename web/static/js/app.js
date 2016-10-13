import 'phoenix_html';
import Vue from 'vue/dist/vue.js';
import VueResource from 'vue-resource';

Vue.use(VueResource);

const vm = new Vue({
  el: '#app',

  data: {
    notes: [],
    payload: {
      note: {
        from: '',
        body: ''
      }
    }
  },

  created: function () {
    this.fetchNotes();
  },

  methods: {
    fetchNotes: function () {
      console.log('Fetching…');
      this.$http.get('/api/notes').then((res) => {
        this.notes = res.body.notes;
      }, (res) => {
        console.error(`Error: ${res.body}`);
      });
    },
    createNote: function () {
      console.log('Creating…');
      const payload = JSON.stringify(this.payload);
      this.$http.post('/api/notes', payload).then((res) => {
        this.fetchNotes();
        this.payload = {note: {from: '', body: ''}};
      }, (res) => {
        console.error(`Error: ${res.body}`);
      });
    }
  }
});
