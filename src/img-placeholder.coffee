# Img Placeholder
# @author shallker.wang@profero.com
# @license MIT

class ImgPlaceholder
  
  @color: '#888'
  @BGColor: '#DDD'
  @formats: ['jpg', 'jpeg', 'png', 'gif']

  @enable: ->
    imgs = document.getElementsByTagName 'img'
    @fill img for img in imgs

  @onLoad: =>
    @enable()

  @fill: (img)->
    return if not @valide img
    holder = img.attributes.placeholder.value
    img.src = @generateImgData @parse holder

  @valide: (img)->
    return false if not img.attributes.placeholder
    return false if img.src && img.src != window.location.href
    true

  @parse: (holder)->
    result = {}
    size = holder.split('x')
    result.alt = holder
    result.width = size[0]
    result.height = size[1]
    result

  @generateImgData: (result)->
    canvas = @createCanvas result.width, result.height, result.alt
    canvas.toDataURL()

  @createCanvas: (width, height, text)->
    canvas = document.createElement('canvas')
    canvas.width = width
    canvas.height = height
    canvasContext = canvas.getContext('2d');
    canvasContext.fillStyle = @BGColor;
    canvasContext.fillRect(0, 0, width, height);
    canvasContext.fillStyle = @color;
    canvasContext.font = "#{width/10}px Arial";
    canvasContext.fillText(text, width/3.3, height/2);
    canvas

@ImgPlaceholder = ImgPlaceholder