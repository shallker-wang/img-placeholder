/*
  DOM Loader
  @author shallker.wang@profero.com
  @license MIT
*/

(function() {
  var DOMLoader;

  DOMLoader = (function() {
    var document;

    function DOMLoader() {}

    document = window.document;

    DOMLoader.loaded = false;

    DOMLoader.list = [];

    DOMLoader.init = function() {
      if (this.isLoaded()) {
        this.loaded = true;
      } else {
        this.listenLoad();
      }
      return this;
    };

    DOMLoader.load = function(fn) {
      if (typeof fn !== 'function') {
        return;
      }
      if (this.loaded) {
        return fn();
      }
      return this.list.push(fn);
    };

    DOMLoader.listenLoad = function(fn) {
      if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', this.onLoad, false);
        return window.addEventListener('load', this.onLoad, false);
      } else {
        document.attachEvent('onreadystatechange', this.onLoad);
        return window.attachEvent('onload', this.onLoad);
      }
    };

    DOMLoader.isLoaded = function() {
      return document.readyState !== "loading";
    };

    DOMLoader.onLoad = function() {
      var fn, _results;
      DOMLoader.loaded = true;
      _results = [];
      while (DOMLoader.list.length) {
        fn = DOMLoader.list.shift();
        _results.push(fn());
      }
      return _results;
    };

    return DOMLoader;

  }).call(this);

  this.DOMLoader = DOMLoader.init();

}).call(this);

/*
  Img Placeholder
  @author shallker.wang@profero.com
  @license MIT
*/

(function() {
  var ImgPlaceholder;

  ImgPlaceholder = (function() {

    function ImgPlaceholder() {}

    ImgPlaceholder.color = '#888';

    ImgPlaceholder.BGColor = '#DDD';

    ImgPlaceholder.formats = ['jpg', 'jpeg', 'png', 'gif'];

    ImgPlaceholder.enable = function() {
      var img, imgs, _i, _len, _results;
      imgs = document.getElementsByTagName('img');
      _results = [];
      for (_i = 0, _len = imgs.length; _i < _len; _i++) {
        img = imgs[_i];
        _results.push(this.fill(img));
      }
      return _results;
    };

    ImgPlaceholder.onLoad = function() {
      return ImgPlaceholder.enable();
    };

    ImgPlaceholder.fill = function(img) {
      var holder;
      if (!this.valide(img)) {
        return;
      }
      holder = img.attributes.placeholder.value;
      return img.src = this.generateImgData(this.parse(holder));
    };

    ImgPlaceholder.valide = function(img) {
      if (!img.attributes.placeholder) {
        return false;
      }
      if (img.src && img.src !== window.location.href) {
        return false;
      }
      return true;
    };

    ImgPlaceholder.parse = function(holder) {
      var result, size;
      result = {};
      size = holder.split('x');
      result.alt = holder;
      result.width = size[0];
      result.height = size[1];
      return result;
    };

    ImgPlaceholder.generateImgData = function(result) {
      var canvas;
      canvas = this.createCanvas(result.width, result.height, result.alt);
      return canvas.toDataURL();
    };

    ImgPlaceholder.createCanvas = function(width, height, text) {
      var canvas, canvasContext;
      canvas = document.createElement('canvas');
      canvas.width = width;
      canvas.height = height;
      canvasContext = canvas.getContext('2d');
      canvasContext.fillStyle = this.BGColor;
      canvasContext.fillRect(0, 0, width, height);
      canvasContext.fillStyle = this.color;
      canvasContext.font = "" + (width / 10) + "px Arial";
      canvasContext.fillText(text, width / 3.3, height / 2);
      return canvas;
    };

    return ImgPlaceholder;

  }).call(this);

  this.ImgPlaceholder = ImgPlaceholder;

}).call(this);

DOMLoader.load( ImgPlaceholder.onLoad )