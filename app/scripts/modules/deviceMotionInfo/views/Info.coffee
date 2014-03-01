define [
  'application'
  'templates'
], (MyApp, JST) ->
  MyApp.module "DeviceMotionApp", (DeviceMotionApp, MyApp, Backbone, Marionette, $, _, JST) ->

    class DeviceMotionApp.InfoView extends Marionette.ItemView
      template: JST['app/scripts/modules/deviceMotionInfo/templates/Info.ejs']
      events:
        'click .glyphicon': 'showDetail'

      showDetail: ->
        DeviceMotionApp.trigger 'showDetail'

  , JST
