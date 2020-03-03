$(function(){
  var search_list = $("events__wrapper");
  
  function appendPost(post) {
    var html = `<div class="events__content col-sm-6 col-md-4 mb-3">
                  <div class="card" id="${post.id}">
                    <label class="m-1">
                      <img class="card-img-top" src="${post.image}">
                      <div class="card-body event">
                        <h5><a class="event-title stretched-link text-decoration-none" href="/posts/${post.id}">${post.title}</a></h5>
                        <div class="event__name">
                          ${post.name}
                        </div>
                        <div class="text-right">
                          ${post.created_at}
                        </div>
                      </div>
                    </label>
                  </div>
                  <div class="card col-auto">
                    <div class="text-left">
                      <div class="badge badge-primary" data-role="tagsinput">
                        <a class="text-decoration-none text-white" href="/tags/%E5%B1%B1%E7%99%BB%E3%82%8A">${post.tag_name}</a>
                      </div>
                    </div>
                  </div>
                  <div class="offset-8 col-auto card">
                    <div class="text-center">
                      <div class="like-link" id="like-link-${post.id}">
                        <a data-remote="true" rel="nofollow" data-method="delete" href="/like/${post.id}">
                          <div class="iine__button">
                            <i class="fas fa-thumbs-up"></i>
                            ${post.likes}
                          </div>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }



  $(".search-input").on("keyup", function(){
    var input = $(".search-input").val();
    var url = $('#forms').attr('action');
    $.ajax({
      type: 'GET',
      url: url,
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts){
      $(".events__wrapper").empty();
    })
    .fail(function(){
      console.log('NG');
    });

  });
})