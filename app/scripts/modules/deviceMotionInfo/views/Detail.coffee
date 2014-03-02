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
        @listenTo DeviceMotionApp, 'shake', @onShake

        @model = new DeviceMotionApp.DetailModel
        window.addEventListener 'devicemotion', @updateData, false

      onClose: ->
        window.removeEventListener 'devicemotion', @updateData

      onShake: ->
        @model.trigger 'shake'

        clearInterval @timeoutId
        @timeoutId = setTimeout =>
          @model.trigger 'restart'
          @render()
        , 2000

        @render()

      updateData: (e) =>
        current = e.accelerationIncludingGravity
        @model.set
          'x': current.x.toFixed(3)
          'y': current.y.toFixed(3)
          'z': current.z.toFixed(3)

        @.render()

      shakeDetected: (e) =>
        @model.trigger 'shake'
        @.render()

      showInfoIcon: ->
        DeviceMotionApp.trigger 'showInfoIcon'

  , JST
