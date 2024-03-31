import React from "react"
import "controllers"

import "trix"
import "@rails/actiontext"
import 'axios';

import jquery from 'jquery'
window.$ = jquery

document.addEventListener('turbo:load', () => {
  const articleId = document.getElementById('article-show').getAttribute('data-article-id')
  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      console.log(response)
    })
})
