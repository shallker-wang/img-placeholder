(->
    class imgPlaceholder
        imgs: []
        imgColor: '000'
        imgBGColor: 'DDD'
        imgAlt: ''
        imgFormat: ['jpg', 'jpeg', 'png', 'gif']

        constructor: ->
            @imgs = document.getElementsByTagName('img')
            @placeholder(@imgs)

        placeholder: (imgs)->
            for img in imgs
                continue if !@valide(img)
                result = @parse(img)
                img.width = result.width
                img.height = result.height
                img.alt = result.alt
                img.style.color = "##{result.color}"
                img.style.backgroundColor = "##{result.bgcolor}"

        valide: (img)->
            return false if img.src == ''
            return false if img.src == window.location.href
            strEndsWith = (str, end) ->
                str.indexOf(end, str.length-end.length) != -1
            for format in @imgFormat
                return false if strEndsWith img.src, format
            return true

        parse: (img)->
            sets = img.src.split('#')
            sizeStr = sets[0].split('/').pop()
            size = sizeStr.split('x')
            result = 
                width: size[0] ? 0
                height: size[1] ? 0
                bgcolor: sets[1] ? @imgBGColor
                color: sets[2] ? @imgColor
                alt: sets[3] ? sizeStr
            return result

    document.addEventListener('DOMContentLoaded', => new imgPlaceholder())
)()