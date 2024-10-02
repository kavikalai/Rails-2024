document.addEventListener('DOMContentLoaded', function() {
  toggle = document.getElementsByClassName('toggle-sidebar-btn')
  toggle[0].addEventListener('click', function(){
    if (document.body.classList.length == 0) {
      document.body.setAttribute('class','toggle-sidebar');
    } else {
      document.body.setAttribute('class','');
    }
  })
});
