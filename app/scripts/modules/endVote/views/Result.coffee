define [
  'application'
  'templates'
], (MyApp) ->
  MyApp.module "EndVoteApp", (EndVoteApp, MyApp, Backbone, Marionette, $, _, JST) ->

    class EndVoteApp.ResultView extends Marionette.ItemView
      template: JST['app/scripts/modules/endVote/templates/Result.ejs']
      className: 'swiper-view'
      events:
        "click .btn": "clickHandler"
      clickHandler: ->
        MyApp.execute('reload')
  , JST
