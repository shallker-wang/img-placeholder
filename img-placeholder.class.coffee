(->
    class imgPlaceholder
        imgs: []
        imgColor: '#888'
        imgBGColor: '#DDD'
        imgAlt: ''
        imgFormat: ['jpg', 'jpeg', 'png', 'gif']

        constructor: ->
            @imgs = document.getElementsByTagName('img')
            @placeholder(@imgs)

        placeholder: (imgs)->
            for img in imgs
                continue if !@valide(img)
                result = @parse(img.attributes.placeholder.value)
                canvas = @createCanvas(result.width, result.height)
                img.src = canvas.toDataURL()

        createCanvas: (width = 300, height = 150)->
            canvas = document.createElement('canvas')
            canvas.width = width
            canvas.height = height
            canvasContext = canvas.getContext('2d');
            canvasContext.fillStyle = @imgBGColor;
            canvasContext.fillRect(0, 0, width, height);
            canvasContext.fillStyle = @imgColor;
            canvasContext.font = "#{width/10}px Arial";
            canvasContext.fillText(@imgAlt, width/3.3, height/2);
            canvas

        valide: (img)->
            return false if !img.attributes.placeholder
            return false if img.src && img.src != window.location.href
            true

        parse: (placeholder)->
            @imgAlt = placeholder
            size = placeholder.split('x')
            {
                width: size[0]
                height: size[1]
            }

    document.addEventListener('DOMContentLoaded', => new imgPlaceholder())
)()