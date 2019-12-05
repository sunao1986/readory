window.addEventListener('DOMContentLoaded',function(){ 

  function buildHTML(data) {
    var html =  '<div class="shelf-title">' +
                  '<div class="shelf-name">' + data.name +
                  '</div>' +
                '</div>' +
                '<div class="rate-shelf">' +
                  '<div class="rate-shelf-none">登録された本はありません</div>' +
                '</div>' +
                '<div id="delete-shelf-point-btn">' +
                  '<div class="delete-shelf-submit" data-shelf-id="' + data.id + '">' +
                    '<input type="submit" value="本棚を減らす" class="shelf-btn-delete" name="commit">' +
                  '</div>' +
                '</div>'
    return html; 
  }
  function shelfFirst() {
    var shelfh = '<div id="add-shelf-first">' +
                    '<div id="add-shelf-point-btn">' +
                      '<div class="add-shelf-submit-first">' +
                        '<input type="submit" value="本棚を増やす" class="shelf-btn-first" name="commit">' +
                      '</div>' +
                    '</div>' +
                  '</div>'
    return shelfh ;
  }
  // ５段目をappendして増減ボタンclass変更を追加
  $(document).on("click","#add-shelf-first",function(){
    var name = "本棚５"
    $.ajax({
      type: 'POST',
      url: '/shelves',
      data: { name: name}, 
      dataType: 'json',
    })
    .done(function(data) {
      // 隠してから表示ではなくidを持たせたhtmlをbuildしてappendにする。隠してた削除ボタンを表示させる
      var html = buildHTML(data);
      $('#add-shelf-point-five').append(html);
      // 本棚を増やすボタンに6番目発火用classを追加
      $(".add-shelf-submit").addClass("add-six");
      // 本棚を減らすボタンに5番目発火用classを追加
      $(".delete-shelf-submit").addClass("five");
      // 5番本棚を増やすボタンは隠す
      $("#add-shelf-first").css("display","none");
      // すでに5番本棚がある場合でも削除時はボタンごとemptyするから下記はいらない
      // $(".five").css("display","block");
      $(".my-review-field").animate({scrollTop: $('.my-review-field')[0].scrollHeight});
      return data;
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    }); 

  });
  // ５段目を削除して増減ボタンのclassを変更
  $(document).on("click",".five", function(){
    var shelf_id = $(this).data("shelf-id");
    $.ajax({
      type: 'DELETE',
      url: '/shelves/' + shelf_id,
      data: { id: shelf_id }, 
      dataType: 'json',
    })
    .done(function(data){
      var inputshelf = shelfFirst();
      $("#add-shelf-point-five").empty();
      $("#add-shelf-first").css("display","block");
      $('#add-shelf-point-five').append(inputshelf);
      
      
    return data;
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    }); 
  });


  // // 6段目の作成と削除
  // $(document).on("click",".add-six", function(){
  //   var name = "本棚６"
  //   $.ajax({
  //     type: 'POST',
  //     url: '/shelves',
  //     data: { name: name}, 
  //     dataType: 'json',
  //   })
  //   .done(function(data) {
  //     var html = buildHTML(data);
  //     $('#add-shelf-point-six').append(html); 
  //     $(".add-shelf-submit").addClass("add-seven");
  //     $(".delete-shelf-submit").addClass("six");
  //     //6番目を増やすボタンは隠す
  //     $(".add-six").css("display","none");
  //     //5番目を減らすボタンは隠す
  //     $(".five").css("display","none");
  //     $(".my-review-field").animate({scrollTop: $('.my-review-field')[0].scrollHeight});
  //     return data;
  //   }) 
  //   .fail(function() {
  //     alert('送信に失敗しました');
  //   });   
  // });
  // $(document).on("click",".six", function(){
  //   var shelf_id = $(this).data("shelf-id");
  //   $.ajax({
  //     type: 'DELETE',
  //     url: '/shelves/' + shelf_id,
  //     data: { id: shelf_id }, 
  //     dataType: 'json',
  //   })
  //   .done(function(data) {
  //     $(".five").css("display","block");
  //     $(".add-six").css("display","block");
  //     $(".add-shelf-submit").removeClass("add-seven");
  //     $(".delete-shelf-submit").removeClass("six");
  //     $("#add-shelf-point-six").empty();
  //     return data;
  //   }) 
  //   .fail(function() {
  //     alert('送信に失敗しました');
  //   }); 
  // });
}); 