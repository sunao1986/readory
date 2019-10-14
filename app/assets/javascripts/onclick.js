window.addEventListener('DOMContentLoaded',function(){ 
 
  // 試験用
  $('review-sub').on('click',function(e){
    e.preventDefault();
    var thumbnailsrc = $('.result-thumbnail').attr('src');
    $('').empty();
    $('').append(thumbnailsrc);  
    //  debugger;
    // window.location.hlef = '/book_reviews/search';
    $('.pop-wrape').fadeIn();
  });

  // 本を選択してpopupレビューフォームを表示
  $('.review-btn').on('click',function(e){
    e.preventDefault();
    // var resultsrc = $('#result-thumbnail').attr('src');
    var resultsrc = $(this).data("image-url");
    $('.book-thumbnail').attr('src',resultsrc);
    $('.pop-wrape').fadeIn();
    // debugger;
  });

  $('.return-btn').on('click',function(){
    $('.pop-wrape').fadeOut();
  });

  // ゲストページでインフルアイコンをクリックするとHowToを表示
  $('.icon-left').on('click',function(e){
    e.preventDefault();
    $('.readory-use').fadeIn();
  });
  $('').on('click',function(){
    $('').fadeOut();
  });

  // ゲストページでログインボタンを押すとボタンが消えて入力フォーム出現
  $('.guest-login-btn').on('click',function(e){
    e.preventDefault();
    $('#guest-empty-field').empty();
    $('.logpop-field').fadeIn();
  });
  $('').on('click',function(){
    $('').fadeOut();
  });

}); 
