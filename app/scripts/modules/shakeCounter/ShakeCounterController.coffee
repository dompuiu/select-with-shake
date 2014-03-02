define [
  'require'
  'application'
  './models/Slider'
  './views/Slider'
], (require, MyApp, JST) ->

  MyApp.module "ShakeCounterApp", (ShakeCounterApp, MyApp, Backbone, Marionette, $, _, JST) ->

    AppController = Marionette.Controller.extend
      initialize: ->
        @.listenTo ShakeCounterApp, 'showSlider', -> @.onShowSlider()

      onShowSlider: ->
        MyApp.counterRegion.show new ShakeCounterApp.SliderView

    ShakeCounterApp.on 'start', ->
      new AppController
      ShakeCounterApp.trigger('showSlider')

    ShakeCounterApp.on 'stop', ->
      MyApp.removeRegion 'counterRegion'

    MyApp.vent.on 'shake', ->
      ShakeCounterApp.trigger 'shake'

    MyApp.vent.on 'endVote', ->
      ShakeCounterApp.stop()

  , JST
