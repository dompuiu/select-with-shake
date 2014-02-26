define [
  'marionette'
  'templates'
  'application'
], (Marionette, JST, Application) ->
  class EndVote extends Marionette.ItemView
    template: JST['app/scripts/templates/EndVote.ejs']
    className: 'swiper-view'
    events:
      "click .btn": "clickHandler"
    clickHandler: ->
      Application.MyApp.execute('reload')
