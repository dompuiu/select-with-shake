define [
  'application'
], (MyApp) ->
  MyApp.module 'DeviceMotionApp', (DeviceMotionApp, MyApp, Backbone, Marionette, $, _) ->

    class DeviceMotionApp.DetailModel extends Backbone.Model
      defaults:
        x: 'no data'
        y: 'no data'
        z: 'no data'
        z: 'no data'
        change: 'no data'
        action: 'Unknown.'
        shakeOn: false

      initialize: ->
        @on 'change', @update
        @on 'shake', @onShake
        @on 'restart', @onRestart

      onShake: ->
        @set 'shakeOn', true

      onRestart: ->
        @set 'shakeOn', false
        @set 'action', 'Unknown.'

      update: ->
        x1 = @get 'x'
        y1 = @get 'y'
        z1 = @get 'z'

        x0 = @previous 'x'
        y0 = @previous 'y'
        z0 = @previous 'z'

        change = Math.abs(x1 - x0) + Math.abs(y1 - y0) + Math.abs(z1 - z0);
        @set 'change', change.toFixed(3), silent: true if !isNaN(change)

        shakeOn = @get 'shakeOn'

        if (shakeOn)
          @set 'action', 'Shaked.', silent: true
        else if (Math.abs(x1) < 0.5 && Math.abs(y1) < 0.5 && Math.abs(z1) > 9 && change < 0.03)
          @set 'action', 'Sitting on a table.', silent: true
        else if (change > 0.6)
          @set 'action', 'Handheld, user moving around.', silent: true
        else if (change > 0.3)
          @set 'action', 'Handheld, user stationary.', silent: true

