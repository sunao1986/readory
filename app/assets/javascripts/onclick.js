window.addEventListener('DOMContentLoaded',function(){ 
 
  // 本を選択してpopupレビューフォームを表示
  $('.review-btn').on('click',function(e){
    e.preventDefault();
    // var resultsrc = $('#result-thumbnail').attr('src');
    var resultsrc = $(this).data("image-url");
    var resulttitle = $(this).data("book-title");
    var resultauthor = $(this).data("author");
    var resultdetail = $(this).data("datail");
    var resultisbn = $(this).data("isbn");
    var resultitem = $(this).data("item-url");
    $('.book-thumbnail').attr('src',resultsrc);
    $('.hidden-image').attr('value',resultsrc);
    $('.hidden-title').attr('value',resulttitle);
    $('.hidden-author').attr('value',resultauthor);
    $('.hidden-datail').attr('value',resultdetail);
    $('.hidden-isbn').attr('value',resultisbn);
    $('.hidden-item').attr('value',resultitem);
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
