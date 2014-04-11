define [
  'application'
  'templates'
], (MyApp, JST) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _, JST) ->
    options = []
    SwiperClass = VotingSlidesApp.SwiperClass

    class VotingSlidesApp.OptionsView extends Marionette.CompositeView
      onRender: ->
        options.unshift([@options.class, @options.index])

        SwiperClass.setClass @options.class
        SwiperClass.setIndex @options.index

        $('.swiper-container', @el).eq(0)
          .addClass(SwiperClass.getFullClass('swiper'))
        $('.pagination', @el).eq(0)
          .addClass(SwiperClass.getFullClass('pagination'))

      onShow: ->
        _.each options, (value, index) =>
          [cssClass, index] = value
          @initSwipe(cssClass, index)

      initSwipe: (cssClass, index) ->
        SwiperClass.setClass cssClass
        SwiperClass.setIndex index

        config =
          pagination: SwiperClass.getUniqueSelector('pagination')
          paginationClickable: true
          mode: 'vertical'
          onSlideChangeStart: (swiper) ->
            slide = $(swiper.activeSlide());

            option = slide.data('option')
            rank = slide.data('rank')

            if not rank
              rank = $('.swiper-slide-active', slide).data('rank')

            MyApp.vent.trigger 'optionChange', option, rank

        if not index?
          config.mode = 'horizontal'
          config.onSlideChangeEnd = (swiper) ->
            $('.pagination', swiper.activeSlide()).each ->
              this.style.display='none';
              this.offsetHeight;
              this.style.display='block';

        new Swiper SwiperClass.getUniqueSelector('swiper'), config

      className: 'swiper-view'
      itemViewContainer: '.swiper-wrapper'
      template: JST['app/scripts/modules/slides/templates/Options.ejs']
      itemView: VotingSlidesApp.OptionView
      emptyView: VotingSlidesApp.NoItemsView
  , JST
