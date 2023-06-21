pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'

# ===== ここを追加 =====
pin_all_from 'app/javascript/favorites', under: 'favorites'
+ pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.3/dist/jquery.js"