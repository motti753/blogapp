import React from "react"
import "controllers"

import "trix"
import "@rails/actiontext"
import 'axios';

import jquery from 'jquery'
window.$ = jquery

// article/show.html.hamlで非表示にしているheartをhas_likedの戻り値によって外す
const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  }else {
    $('.inactive-heart').removeClass('hidden')
  }
  console.log(hasLiked)
}

document.addEventListener('turbo:load', () => {
  const articleId = document.getElementById('article-show').getAttribute('data-article-id')
  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })
})
