define [
  'application'
  'templates'
], (MyApp, JST) ->
  MyApp.module "ShakeCounterApp", (ShakeCounterApp, MyApp, Backbone, Marionette, $, _, JST) ->

    class ShakeCounterApp.SliderView extends Marionette.ItemView
      template: JST['app/scripts/modules/shakeCounter/templates/Slider.ejs']
      className: 'shake-counter fade out'

      initialize: ->
        @model = new ShakeCounterApp.SliderModel

        @listenTo ShakeCounterApp, 'shake', @onShake
        @listenTo @model, 'change:percentage', @updateSlider

      onShake: ->
        @model.trigger('update')
        @detectShow()
        @render()

      detectShow: ->
        @$el.removeClass 'hide'
        setTimeout =>
          @$el.removeClass 'out'
          @$el.addClass 'in'

        clearInterval @timeoutId
        @timeoutId = setTimeout =>
          @$el.removeClass 'in'
          @$el.addClass 'out'

          setTimeout =>
            @$el.addClass 'hide'
          , 500

          @model.trigger('restart')
        , 5000

      updateSlider: ->
        percentage = (@model.get 'percentage') + '%'
        setTimeout =>
          $('.progress-bar', @$el)
            .animate({width: percentage})

  , JST
