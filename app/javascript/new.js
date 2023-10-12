document.addEventListener("DOMContentLoaded", function() {
  var currentURL = location.href;
  var newURL = currentURL.split('?')[0];
  history.replaceState({}, '', newURL);
});

