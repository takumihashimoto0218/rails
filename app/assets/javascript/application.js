import jquery from "jquery"
window.$ = jquery
// import '@hotwired/turbo-rails';
// import 'controllers';
// import 'favorites/create'
// import 'favorites/destroy'

// $(document).on('turbolinks:load', function() {
//   $('#favorite-link, #unfavorite-link').on('ajax:success', function(event) {
//     $(this).closest('.board').find('.favorite-count').text(event.detail[0].favorite_count);
//   });
// });

import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { library } from "@fortawesome/fontawesome-svg-core";
import '@fortawesome/fontawesome-free'
library.add(fas, far, fab)

$(function(){
  alert("jQuery 動いた！")
})
console.log("hello")