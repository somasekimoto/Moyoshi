$(function(){

  var search_list = $(".contents.row");

  function appendTweet(tweet){
    if(post.user_sign_in && post.user_sign_in.id == post.user_id) {
      var current_user = `<li>
                            <a href="/tweets/${tweet.id}/edit" data-method="get" >編集</a>
                          </li>
                          <li>
                            <a href="/tweets/${tweet.id}" data-method="delete" >削除</a>
                          </li>`
    } else {
      var current_user = ""
    }

    var html = `<div class="content_post" style="background-image: url(${tweet.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top-4763537352ebf95dfc22270db55f9aa7798af326400039b6c27cc63b23ea2765.png"></span>
                    <ul class="more_list">
                      <li>
                        <a data-method="get" href="/tweets/${tweet.id}">詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${tweet.text}</p>
                  <span class="name">
                    <a href="/users/${tweet.user_id}">
                      <span>投稿者</span>
                      ${tweet.nickname}
                    </a>
                  </span>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class="name" > ${ msg } </div>`
    search_list.append(html);
  }


  $('.search-input').on("keyup", function(){
    var input = $('.search-input').val();
    $.ajax({
      type: 'GET',
      url: '/tweets/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(tweets){
      $('.contents.row').empty();
      if (tweets.length !== 0){
        tweets.forEach(function(tweet){
          appendTweet(tweet);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});