(->
    class imgPlaceholder
        imgs: []
        imgWidth: 0
        imgHeight: 0
        imgColor: '888'
        imgBGColor: 'DDD'
        imgAlt: ''
        imgFormats: ['jpg', 'jpeg', 'png', 'gif']

        constructor: ->
            @imgs = document.getElementsByTagName('img')
            @placeholder(@imgs)

        placeholder: (imgs)->
            for img in imgs
                continue if !@valide(img)
                @parse(img.src)
                console.log @imgWidth, @imgHeight, @imgBGColor, @imgColor, @imgAlt
                canvas = @createCanvas(@imgWidth, @imgHeight)
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
            return false if img.src == ''
            return false if img.src == window.location.href
            strEndsWith = (str, end) ->
                str.indexOf(end, str.length-end.length) != -1
            for format in @imgFormats
                return false if strEndsWith img.src, format
            true

        parse: (str)->
            sets = str.split('#')
            sizeStr = sets[0].split('/').pop()
            size = sizeStr.split('x')
            @imgWidth   = size[0] if size[0]
            @imgHeight  = size[1] if size[1]
            @imgBGColor = sets[1] if sets[1]
            @imgColor   = sets[2] if sets[2]
            @imgAlt     = sets[3] ? sizeStr

    document.addEventListener('DOMContentLoaded', => new imgPlaceholder())
)()