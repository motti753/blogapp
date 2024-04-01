import 'axios';

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

export default axios