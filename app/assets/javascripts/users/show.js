$(function(){
  var mySwiper = new Swiper('.swiper-container', {
    slidesPerView: 3,
    slideToClickedSlide: true,
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    },
    breakpoints: {
      767: {
        slidesPerView: 1,
        spaceBetween: 0
      }
    }
  });
});
