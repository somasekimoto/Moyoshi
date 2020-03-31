$(function(){
  
  var mySwiper = new Swiper('.swiper-container', {
    autoHeight: true,
    loop: true,
    freeMode: true,
    slidesPerView: 3,
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    }
  });
});