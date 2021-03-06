window.addEventListener('DOMContentLoaded',function(){ 
 
  // 本を選択してpopupレビューフォームを表示
  $('.review-btn').on('click',function(e){
    e.preventDefault();
    var resultsrc = $(this).data("image-url");
    var resulttitle = $(this).data("book-title");
    var resultauthor = $(this).data("author");
    var resultdetail = $(this).data("detail");
    var resultisbn = $(this).data("isbn");
    var resultitem = $(this).data("item-url");
    $('.book-thumbnail').attr('src',resultsrc);
    $('.hidden-image').attr('value',resultsrc);
    $('.hidden-title').attr('value',resulttitle);
    $('.hidden-author').attr('value',resultauthor);
    $('.hidden-detail').attr('value',resultdetail);
    $('.hidden-isbn').attr('value',resultisbn);
    $('.hidden-item').attr('value',resultitem);
    $('.create-wrape').fadeIn();
  });
  // レビューフォームを閉じる
  $('.return-btn').on('click',function(){
    $('.create-wrape').fadeOut();
  });

  // フッターの説明をドロップダウン
  $('.footer-btn').click(function(e){
    e.preventDefault();
    $('.footer-hidden',this).slideToggle();
    $('html,body').animate({scrollTop: 1500});

  });

  // ゲストページでインフルアイコンをクリックするとHowToを表示
  $('.icon-left').on('click',function(e){
    e.preventDefault();
    $('#guest-empty-field').empty();
    $('.guest-hidden-field').fadeIn();
  });
  $('use-back').on('click',function(){
    $('.guest-hidden-field').fadeOut();
  });

  // ゲストページでログインボタンを押すとボタンが消えて入力フォーム出現
  $('.guest-login-btn').on('click',function(e){
    e.preventDefault();
    $('#guest-empty-field').empty();
    $('.logpop-field').fadeIn();
  });
  $('.back-btn').on('click',function(){
    $('.logpop-field').fadeOut();
  });

  // マイページで本を選択して詳細メッセージを表示
  $('.book-freame').mouseenter(function(e){
    e.preventDefault();
    $('.pop-info',this).fadeIn();
  }).mouseleave(function() {
    $('.pop-info',this).fadeOut();
  });

  // 詳細をクリックしてクリックして詳細をpop表示&戻るボタン
  $('.pop-info').on('click',function(e){
    e.preventDefault();
    var detailuser = $(this).data("user-image");
    if(detailuser === ""){
      var detailuser = "/assets/i_flu_g-4ad9149e4d4751b6d4552050e848c19b7d8c6d5cc23400e15de1d3ebacb8dcd9.png"
      $('.detail_user').attr('src',detailuser);
      }
      else{
        $('.detail_user').attr('src',detailuser);
      }
    var detailsrc = $(this).data("image-url");
    $('.detail_book').attr('src',detailsrc);
    var detailtitle = $(this).data("review-title");
    $('p.detail_title').text(detailtitle);
    $('#review_title').attr('value',detailtitle);
    var detailreview = $(this).data("review");
    $('.new-review-text-area__cont').text(detailreview);
    $('#review').val(detailreview);
    var detailurl = $(this).data("url");
    // $('#edit-form').attr('method','patch');
    $('#edit-form').attr('action',detailurl);
    var detailid = $(this).data("book-id");
    $('.btn-done').attr('href',"book_review/"+ detailid);
    $('.btn-done').attr('book_id',detailid);

    $('.detail-wrape').fadeIn();
  });
  $('.return-btn').on('click',function(){
    $('.detail-wrape').fadeOut();

  });

  // popの編集ボタンを押して編集画面を表示
  $('.pop-review-bottom-btn').on('click',function(e){
    e.preventDefault();
    $('.detail-wrape').fadeOut();
    $('.edit-wrape').fadeIn();
  });
  $('.return-edit-btn').on('click',function(){
    $('.edit-wrape').fadeOut();
  });

// ユーザー検索の自己紹介のドロップダウン表示
  $('.user-result-bottom').click(function(e){
    e.preventDefault();
    $('.hidden-area',this).slideToggle();
  }); 
// ユーザー検索のサムネイルのマウスオーバーでメッセージ出現
  $('.user-result-top__image').mouseenter(function(e){
    e.preventDefault();
    $(this).prev('.hidden-message').fadeIn();
  }).mouseleave(function() {
    $(this).prev('.hidden-message').fadeOut();
  });

    // indexから詳細を読むボタン
  $('.new-review-bottom').on('click',function(e){
    e.preventDefault();
    var detailuser = $(this).data("user-image");
    if(detailuser === ""){
      var detailuser = "/assets/i_flu_g-4ad9149e4d4751b6d4552050e848c19b7d8c6d5cc23400e15de1d3ebacb8dcd9.png"
      $('.detail_user').attr('src',detailuser);
      }
      else{
        $('.detail_user').attr('src',detailuser);
      }
    var detailsrc = $(this).data("image-url");
    $('.detail_book').attr('src',detailsrc);
    var detailtitle = $(this).data("review-title");
    $('p.detail_title').text(detailtitle);
    $('#review_title').attr('value',detailtitle);
    var detailreview = $(this).data("review");
    $('.new-review-text-area__cont').text(detailreview);
    $('#review').val(detailreview);
    $('.detail-wrape').fadeIn();
  });
  $('.return-btn').on('click',function(){
    $('.detail-wrape').fadeOut();

  });

}); 
