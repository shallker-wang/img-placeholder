// Generated by CoffeeScript 1.4.0
(function() {

  (function() {
    var imgPlaceholder,
      _this = this;
    imgPlaceholder = (function() {

      imgPlaceholder.prototype.imgs = [];

      imgPlaceholder.prototype.imgColor = '#888';

      imgPlaceholder.prototype.imgBGColor = '#DDD';

      imgPlaceholder.prototype.imgAlt = '';

      imgPlaceholder.prototype.imgFormat = ['jpg', 'jpeg', 'png', 'gif'];

      function imgPlaceholder() {
        this.imgs = document.getElementsByTagName('img');
        this.placeholder(this.imgs);
      }

      imgPlaceholder.prototype.placeholder = function(imgs) {
        var canvas, img, result, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = imgs.length; _i < _len; _i++) {
          img = imgs[_i];
          if (!this.valide(img)) {
            continue;
          }
          result = this.parse(img.attributes.placeholder.value);
          canvas = this.createCanvas(result.width, result.height);
          _results.push(img.src = canvas.toDataURL());
        }
        return _results;
      };

      imgPlaceholder.prototype.createCanvas = function(width, height) {
        var canvas, canvasContext;
        if (width == null) {
          width = 300;
        }
        if (height == null) {
          height = 150;
        }
        canvas = document.createElement('canvas');
        canvas.width = width;
        canvas.height = height;
        canvasContext = canvas.getContext('2d');
        canvasContext.fillStyle = this.imgBGColor;
        canvasContext.fillRect(0, 0, width, height);
        canvasContext.fillStyle = this.imgColor;
        canvasContext.font = "" + (width / 10) + "px Arial";
        canvasContext.fillText(this.imgAlt, width / 3.3, height / 2);
        return canvas;
      };

      imgPlaceholder.prototype.valide = function(img) {
        if (!img.attributes.placeholder) {
          return false;
        }
        if (img.src && img.src !== window.location.href) {
          return false;
        }
        return true;
      };

      imgPlaceholder.prototype.parse = function(placeholder) {
        var size;
        this.imgAlt = placeholder;
        size = placeholder.split('x');
        return {
          width: size[0],
          height: size[1]
        };
      };

      return imgPlaceholder;

    })();
    return document.addEventListener('DOMContentLoaded', function() {
      return new imgPlaceholder();
    });
  })();

}).call(this);
