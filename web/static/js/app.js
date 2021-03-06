import 'phoenix_html';
import Vue from 'vue/dist/vue.js';
import VueResource from 'vue-resource';
import Dates from 'date-math';

Vue.use(VueResource);

let vm = new Vue({
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

  computed: {
    reversedNotes: function () {
      return this.notes.reverse();
    }
  },

  created: function () {
    this.fetchNotes();
  },

  methods: {
    fetchNotes: function () {
      this.$http.get('/api/notes').then((res) => {
        this.notes = res.body.notes;
      }, (res) => {
        console.error(`Error: ${res.body}`);
      });
    },
    createNote: function () {
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

const modal = document.getElementsByClassName('modal')[0];
const modalSubmit = document.getElementsByClassName('modal__submit')[0];
const modalClose = document.getElementsByClassName('modal__close')[0];
const modalOverlay = document.getElementsByClassName('modal-overlay')[0];
const msgButton = document.getElementById('msg-btn');

function toggleModal() {
  const visClass = 'is-visible';
  if (modal.classList.contains(visClass)) {
    modal.classList.remove(visClass);
    modalOverlay.classList.remove(visClass);
  } else {
    modal.classList.add(visClass);
    modalOverlay.classList.add(visClass);
  }
}

msgButton.addEventListener('click', (e) => {
  e.preventDefault();
  toggleModal();
}, false);
modalSubmit.addEventListener('click', toggleModal, false);
modalClose.addEventListener('click', toggleModal, false);

const daysEl = document.getElementsByClassName('days')[0];
const bday = new Date('2015-10-25T14:30Z');

function diffDates() {
  const diff = Dates.day.diff(bday, Date.now());
  daysEl.innerText = diff;
}

const intervalID = window.setInterval(diffDates, 500);

diffDates();
