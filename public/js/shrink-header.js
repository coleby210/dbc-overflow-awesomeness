// source: http://codepen.io/tomdurkin/pen/nvAjd

$(document).on("scroll", function(){
  if
    ($(document).scrollTop() > 100){
    $("header").addClass("shrink");
    // updateSliderMargin();
  }
  else
  {
    $("header").removeClass("shrink");
    // updateSliderMargin();
  }
});
