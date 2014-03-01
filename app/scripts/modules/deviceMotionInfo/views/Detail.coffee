define [
  'application'
  'templates'
], (MyApp, JST) ->
  MyApp.module "DeviceMotionApp", (DeviceMotionApp, MyApp, Backbone, Marionette, $, _, JST) ->

    class DeviceMotionApp.DetailView extends Marionette.ItemView
      template: JST['app/scripts/modules/deviceMotionInfo/templates/Detail.ejs']
      events:
        'click .close': 'showInfoIcon'
      initialize: ->
        @model = new DeviceMotionApp.DetailModel
        window.addEventListener 'devicemotion', @updateData, false
        window.addEventListener 'shake', @shakeDetected, false

      onClose: ->
        window.removeEventListener 'devicemotion', @updateData
        window.removeEventListener 'shake', @shakeDetected

      updateData: (e) =>
        current = e.accelerationIncludingGravity
        @model.set
          'x': current.x.toFixed(3)
          'y': current.y.toFixed(3)
          'z': current.z.toFixed(3)

        @.render()

      shakeDetected: (e) =>
        @model.shakeChange()
        @.render()

      showInfoIcon: ->
        DeviceMotionApp.trigger 'showInfoIcon'

  , JST
