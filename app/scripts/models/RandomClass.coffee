define [
], ->

  RandomClass = {
    names: ['red', 'blue', 'orange', 'green', 'pink']
    index: 0

    getRandomClass: () ->
      if @index >= @names.length
        @index = 0

      @names[@index++] + '-slide'

    getClass: () ->
      @name = 'swiper-slide '
      @name += @getRandomClass()
  }
