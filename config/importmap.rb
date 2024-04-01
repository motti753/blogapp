# Pin npm packages by running ./bin/importmap
# config/importmap.rb
pin 'react', to: 'https://ga.jspm.io/npm:react@17.0.2/index.js'
pin 'jquery' # @3.7.1

pin '@rails/actioncable', to: 'actioncable.esm.js'
pin '@rails/activestorage', to: 'activestorage.esm.js'

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/modules', under: 'modules'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.esm.js'
pin '@rails/request.js', to: 'https://ga.jspm.io/npm:@rails/request.js@0.0.8/src/index.js'
pin 'axios', to: 'https://cdnjs.cloudflare.com/ajax/libs/axios/1.2.3/axios.min.js', preload: true
pin 'object-assign' # @4.1.1
pin '#lib/adapters/http.js', to: '#lib--adapters--http.js.js' # @2.0.1
pin '#lib/platform/node/classes/FormData.js', to: '#lib--platform--node--classes--FormData.js.js' # @2.0.1
pin '#lib/platform/node/index.js', to: '#lib--platform--node--index.js.js' # @2.0.1