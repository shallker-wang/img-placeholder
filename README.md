Img Placeholder
===============

> UPDATE: use canvas to creates DataURL for each valid img tag

## How to use it
1. Put `<script src="img-placeholder.js">` in your HTML's head.
2. Write an img tag with a placeholder attribute `<img placeholder="40x80">` in your HTML's body.
3. That's it.

## Example
```html
<img placeholder="100x200">
<img placeholder="200x200" src="">
<img placeholder="270x129" src="http://www.baidu.com/img/baidu_sylogo1.gif">
```

## Fallback
When an `img` tag has a `src` attribute and it's not empty, it will be ignored by img-placeholder and displayed as a normal image.  
Try `<img placeholder="270x129" src="http://www.baidu.com/img/baidu_sylogo1.gif">`.  

## License
Img Placeholder is under license [MIT](http://opensource.org/licenses/MIT).
