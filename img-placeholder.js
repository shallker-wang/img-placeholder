document.addEventListener('DOMContentLoaded', function() {
  var img, imgs, placeholder, size, _i, _len, _results;
  imgs = document.getElementsByTagName('img');
  _results = [];
  for (_i = 0, _len = imgs.length; _i < _len; _i++) {
    img = imgs[_i];
    if (!img.attributes.placeholder) {
      continue;
    }
    if (img.src) {
      continue;
    }
    placeholder = img.attributes.placeholder.value;
    size = placeholder.split('x');
    img.width = size[0];
    img.height = size[1];
    img.alt = placeholder;
    _results.push(img.style.backgroundColor = '#DDD');
  }
  return _results;
});