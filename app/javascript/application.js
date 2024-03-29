// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")

// require("trix")
// require("@rails/actiontext")
import React from "react"
import "controllers"

import "trix"
import "@rails/actiontext"
import 'axios';

import jquery from 'jquery'
window.$ = jquery

document.addEventListener('turbo:load', () => {
  $('.article_title').on('click', () => {
    axios.get('/')
      .then((response) => {
        console.log(response)
      })
  })
})
