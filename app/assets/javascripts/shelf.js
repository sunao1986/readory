window.addEventListener('DOMContentLoaded',function(){ 

  $(".shelf-name-edit").on("click", function(){
    $(".shelf-edit-input").css("display","block");
    $(".shelf-edit").css("display","block");
    $(".shelf-cancel").css("display","block");
    $(".shelf-name-edit").css("display","none");
    $(".shelf-btn").css("width","80px");
  });

  $(".shelf-cancel").on("click", function(){
    $(".shelf-edit-input").css("display","none");
    $(".shelf-edit").css("display","none");
    $(".shelf-cancel").css("display","none");
    $(".shelf-name-edit").css("display","block");
    $(".shelf-btn").css("width","140px");
  });


  $(".shelfa-edit").on("click", function(){
    var shelfaName = $("#shelfa").val();
    var user_id = $(".my-review-field").data("id");
    $.ajax({
      type: 'PATCH',
      url: '/users/' + user_id,
      data: { shelfa: shelfaName, id: user_id}, 
      dataType: 'json',
    })
    .done(function(data) {  
      var shelfaName = $("#shelfa").val();
      $(".shelfa-name").text(shelfaName);
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    });    
  });

  $(".shelfb-edit").on("click", function(){
    var shelfaName = $("#shelfb").val();
    var user_id = $(".my-review-field").data("id");
    $.ajax({
      type: 'PATCH',
      url: '/users/' + user_id,
      data: { shelfb: shelfaName, id: user_id}, 
      dataType: 'json',
    })
    .done(function(data) {  
      var shelfaName = $("#shelfb").val();
      $(".shelfb-name").text(shelfaName);
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    });    
  });

  $(".shelfc-edit").on("click", function(){
    var shelfaName = $("#shelfc").val();
    var user_id = $(".my-review-field").data("id");
    $.ajax({
      type: 'PATCH',
      url: '/users/' + user_id,
      data: { shelfc: shelfaName, id: user_id}, 
      dataType: 'json',
    })
    .done(function(data) {  
      var shelfaName = $("#shelfc").val();
      $(".shelfc-name").text(shelfaName);
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    });    
  });

  $(".shelfd-edit").on("click", function(){
    var shelfaName = $("#shelfd").val();
    var user_id = $(".my-review-field").data("id");
    $.ajax({
      type: 'PATCH',
      url: '/users/' + user_id,
      data: { shelfd: shelfaName, id: user_id}, 
      dataType: 'json',
    })
    .done(function(data) {  
      var shelfaName = $("#shelfd").val();
      $(".shelfd-name").text(shelfaName);
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    });    
  });

  $(".shelfe-edit").on("click", function(){
    var shelfName = $("#name").val();
    var shelf_id = $(".five").data("shelf-id");
    $.ajax({
      type: 'PATCH',
      url: '/shelves/' + shelf_id,
      data: { id: shelf_id, name: shelfName}, 
      dataType: 'json',
    })
    .done(function(data) {  
      var shelfName = $("#name").val();
      $(".shelfe-name").text(shelfName);
    }) 
    .fail(function() {
      alert('送信に失敗しました');
    });    
  });

}); 