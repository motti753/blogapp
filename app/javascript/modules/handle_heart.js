import axios from 'modules/axios';
import jquery from 'jquery'
window.$ = jquery


// .inactive-heartをクリックしたらcreateメソッドを呼び出し、active-heartを表示させる
const listenInactiveHeartEvent = (articleId) => {
  $('.inactive-heart').on('click', () => {
    axios.post(`/api/articles/${articleId}/like`)
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
}
// .active-heartをクリックしたらdeleteメソッドを呼び出し、inactive-heartを表示させる
const listenActiveHeartEvent = (articleId) => {
  $('.active-heart').on('click', () => {
    axios.delete(`/api/articles/${articleId}/like`)
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
}

// 2つのメソッドを他のJSで使えるようにexportする
export {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
}