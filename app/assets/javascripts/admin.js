//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap

function previewImage(image, previewId) {
  var reader = new FileReader();
  reader.readAsDataURL(image.files[0]);
  reader.onload = function (event) {
    document.getElementById(previewId).src = event.target.result;
  };
}
