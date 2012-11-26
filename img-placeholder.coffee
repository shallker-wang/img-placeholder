document.addEventListener('DOMContentLoaded', ->
    imgs = document.getElementsByTagName('img')
    for img in imgs
        continue if !img.attributes.placeholder
        continue if img.src
        placeholder = img.attributes.placeholder.value
        size = placeholder.split('x')
        img.width = size[0]
        img.height = size[1]
        img.alt = placeholder
        img.style.backgroundColor = '#DDD'
)