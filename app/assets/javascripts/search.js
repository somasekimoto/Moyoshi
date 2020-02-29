// $(function(){

//   var search_list = $(".events__wrapper");

//   function appendPost(post){
//     var html = `<div class="events__content col-sm-6 col-md-3 mb-3">
//                   <div class="card" id="${post.id}">
//                     <label class="m-1">
//                       <img class="card-img-top" src="${post.image}">
//                       <div class="card-body event">
//                         <h5>
//                           <a class="event-title stretched-link text-decoration-none" href="/posts/${post.id}">${post.title}</a>
//                         </h5>
//                         <div class="event__name">
//                           ${post.name}
//                         </div>
//                         <div class="text-right">
//                           ${post.time}
//                         </div>
//                       </div>
//                     </label>
//                   </div>
//                   <div class="card col-auto">
//                     <div class="text-left">
//                       <div class="badge badge-primary" data-role="tagsinput">
//                         <a class="text-decoration-none text-white" href="/tags/:tag">${post.tag_name}</a>
//                       </div>
//                     </div>
//                   </div>
//                   <div class="offset-8 col-auto card">
//                     <div class="text-center">
//                       <div class="like-link" id="like-link-${post.id}">
//                         <a data-remote="true" rel="nofollow" data-method="post" href="/like/${post.id}">
//                           <div class="iine__button">
//                             <i class="far fa-thumbs-up">
//                               ${post.likes}
//                             </i>
//                           </div>
//                         </a>
//                       </div>
//                     </div>
//                   </div>
//                 </div>`
//     search_list.append(html);
//   }

//   function appendErrMsgToHTML(msg) {
//     var html = `<div class="name text-white" > ${ msg } </div>`
//     search_list.append(html);
//   }


//   $('.search-input').on("keyup", function(){
//     var input = $('.search-input').val();
//     $.ajax({
//       type: 'GET',
//       url: '/posts/search',
//       data: { _posts_search_keyword: input },
//       dataType: 'json'
//     })
//     .done(function(posts){
//       $('.events__wrapper').empty();
//       if (posts.length !== 0){
//         posts.forEach(function(post){
//           appendPost(post);
//         });
//       }
//       else {
//         appendErrMsgToHTML("一致する投稿がありません");
//       }
//     })
//     .fail(function() {
//       alert('error');
//     });
//   });
// });