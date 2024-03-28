// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

// I Had to change:
import DoISuportIt from 'components/DoISuportIt';

// to (notice the missing `./`)
import DoISuportIt from './components/DoISuportIt';

document.addEventListener('DOMContentLoaded', () => {
  window.alert('DOM LOADED')
})
