$(document).ready(function() {

  $(window).scroll( function() {

    $('.hideme').each( function(i){

      var bottom_of_object = $(this).offset().top + $(this).outerHeight();

      var bottom_of_window = $(window).scrollTop() + $(window).height();

      if( bottom_of_window > bottom_of_object ){
        $(this).addClass("active");
      }
    });
  });
});

function Filtro(tagId) {
  var tagId, component;
  component = document.getElementsByClassName("card");
  for (let i = 0; i < component.length; i++) {
    if (component[i].id == tagId || tagId == "all") {
      component[i].style.display = "inline-block";
    } else {
      component[i].style.display = "none";
    }
  }
}
