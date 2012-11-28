(->
    class imgPlaceholder
        imgs: []
        imgWidth: 0
        imgHeight: 0
        imgColor: '#888'
        imgBGColor: '#DDD'
        imgAlt: ''
        imgFormats: ['jpg', 'jpeg', 'png', 'gif']

        constructor: ->
            @imgs = document.getElementsByTagName('img')
            @placeholder(@imgs)

        placeholder: (imgs)->
            for img in imgs
                continue if !@valide(img)
                @parse(img.attributes.placeholder.value)
                img.src = @createCanvas().toDataURL()

        createCanvas: ->
            canvas = document.createElement('canvas')
            canvas.width = @imgWidth
            canvas.height = @imgHeight
            canvasContext = canvas.getContext('2d');
            canvasContext.fillStyle = @imgBGColor;
            canvasContext.fillRect(0, 0, @imgWidth, @imgHeight);
            canvasContext.fillStyle = @imgColor;
            canvasContext.font = "#{@imgWidth/10}px Arial";
            canvasContext.fillText(@imgAlt, @imgWidth/3.3, @imgHeight/2);
            canvas

        valide: (img)->
            return false if !img.attributes.placeholder
            return false if img.src && img.src != window.location.href
            true

        parse: (placeholder)->
            @imgAlt = placeholder
            size = placeholder.split('x')
            @imgWidth = size[0]
            @imgHeight = size[1]

    document.addEventListener('DOMContentLoaded', => new imgPlaceholder())
)()