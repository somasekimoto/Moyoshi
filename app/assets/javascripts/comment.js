$(function(){
  function buildHTML(comment){
    var html = `<div class="text-wrap text-break row mx-3">
                  <p class="col-3">
                    ${comment.user_name}:
                  </p>
                  <p class="col-auto text-left">
                    ${comment.text}
                  </p>
                </div>`
    return html;
  }
  
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.comment_text').val('');
      $('.comment_submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメント送信に失敗しました。');
    });
  })
})