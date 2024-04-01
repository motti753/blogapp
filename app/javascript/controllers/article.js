import 'axios';

import jquery from 'jquery'
window.$ = jquery

// Token ------------------------------ //
// axiosのrequest時にheadersにCSRF-Tokenを格納する
axios.interceptors.request.use((config) => {
  if(['post', 'put', 'patch', 'delete'].includes(config.method)) {
    config.headers['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
  }
  return config;
}, (error) => {
  return Promise.reject(error);
});
// Token ------------------------------ //

// like ------------------------------ //
// article/show.html.hamlで非表示にしているheartをhas_likedの戻り値によって外す
const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  }else {
    $('.inactive-heart').removeClass('hidden')
  }
  console.log(hasLiked)
}
// like ------------------------------ //

// comment ------------------------------ //
const handleCommentForm = () => {
  $('.show-comment-form').addClass('hidden')
  $('.comment-text-area').removeClass('hidden')
}

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class='article_comment'><p>${comment.content}</p></div>`
  )
}
// comment ------------------------------ //

document.addEventListener('turbo:load', () => {
  const article = document.getElementById('article-show')
  const articleId = article.dataset.articleId

  // comment一覧を表示
  axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })
  
  // comment ------------------------------ //
  // show-comment-formが押されたら、comment textformを表示させる
  $('.show-comment-form').on('click', () => {
    handleCommentForm()
  })
  // add-comment-buttonが押されたら、comments_controller createを呼び出す
  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content){
      window.alert('コメントを入力してください')
    }else {
      axios.post(`/articles/${articleId}/comments`, {
        comment: {content: content}
      })
        .then((response) => {
          const comment = response.data
          appendNewComment(comment)
          $('#comment_content').val('')
        })
    }
  })
  // comment ------------------------------ //

  // like ------------------------------ //
  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })
  
  $('.inactive-heart').on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        console.log(response)
        if (response.data.status == 'OK') {
          $('.inactive-heart').addClass('hidden')
          $('.active-heart').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-heart').on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status == 'OK') {
          $('.active-heart').addClass('hidden')
          $('.inactive-heart').removeClass('hidden')
        }
        console.log(response)
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
  // like ------------------------------ //
})

// import applyCaseMiddleware from "axios-case-converter";
// import axios from "axios";

// const options = {
//   ignoreHeaders: true,
// };

// const client = applyCaseMiddleware(
//   axios.create({
//     baseURL: `http://localhost:3000/articles`,
//   }),
//   options
// );

// export default client;
// get
// export const getList = () => {
//   return client.get(`/${articleId}/like`)
// };

// // detail
// export const getDetail = (id) => {
//   return client.get(`/actors/${id}`);
// };

// create
// export const createActor = (params) => {
//   return client.post('/like', params);
// };