define [
  'require'
  'application'
  './models/Detail'
  './views/Info'
  './views/Detail'
], (require, MyApp, JST) ->

  MyApp.module "DeviceMotionApp", (DeviceMotionApp, MyApp, Backbone, Marionette, $, _, JST) ->

    AppController = Marionette.Controller.extend
      initialize: ->
        @.listenTo DeviceMotionApp, 'showDetail', -> @.onShowDetail()
        @.listenTo DeviceMotionApp, 'showInfoIcon', -> @.onShowInfoIcon()

      onShowDetail: ->
        MyApp.infoRegion.show new DeviceMotionApp.DetailView

      onShowInfoIcon: ->
        MyApp.infoRegion.show new DeviceMotionApp.InfoView


    DeviceMotionApp.on 'start', ->
      new AppController
      DeviceMotionApp.trigger('showInfoIcon')

  , JST
