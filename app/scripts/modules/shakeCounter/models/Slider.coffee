define [
  'application'
], (MyApp) ->
  MyApp.module 'ShakeCounterApp', (ShakeCounterApp, MyApp, Backbone, Marionette, $, _) ->

    class ShakeCounterApp.SliderModel extends Backbone.Model
      defaults:
        tries: 3
        percentage: 0
        initialPercentage: 0

      initialize: ->
        @on 'restart', @restart
        @on 'update', @update
        @on 'change:tries', @checkShakeStatus

      restart: ->
        @set({
          'tries': 3
          'percentage': 0
        },{
          silent: true
        })

      update: ->
        tries = @get 'tries'
        percentage = @get 'percentage'
        @set
          'tries': --tries
          'percentage': percentage + 33
          'initialPercentage': percentage

      checkShakeStatus: ->
        tries = @get 'tries'
        if (tries == 0)
          MyApp.execute('endVote')
