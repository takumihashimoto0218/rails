// // history.replaceState("","",location.href + "/new");
// // ページのロード時に実行される関数
// window.addEventListener('DOMContentLoaded', () => {
//   // ボタンやリンクなどの対象要素を取得
//   const changeURLButton = document.getElementById('change-url-button');

//   // ボタンがクリックされた際の処理
//   changeURLButton.addEventListener('click', () => {
//     // 新しいURLを設定（/boards/new）
//     const newURL = '/boards/new';
    
//     // ブラウザの履歴を変更してURLを更新
//     window.history.pushState({}, '', newURL);
//   });
// });

document.addEventListener("DOMContentLoaded", function() {
  var currentURL = location.href;
  var newURL = currentURL.split('?')[0];
  history.replaceState({}, '', newURL);
});

