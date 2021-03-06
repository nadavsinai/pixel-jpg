# Dependencies
PixelUtil= (require 'pixel-util').PixelUtil
jpegJs= require 'jpeg-js'

class PixelJpg extends PixelUtil
  parse: (file)->
    @createBuffer file
    .then (buffer)=>
      jpegData= jpegJs.decode buffer

      image= @createImageData jpegData.width,jpegData.height
      @set image,jpegData
      delete jpegData.data

      image[key]= value for key,value of jpegData

      [image]

module.exports= new PixelJpg
module.exports.PixelJpg= PixelJpg
