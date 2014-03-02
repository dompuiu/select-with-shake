define [
  'require'
  'application'
  './views/Result'
], (require, MyApp, JST) ->

  MyApp.module "EndVoteApp", (EndVoteApp, MyApp, Backbone, Marionette, $, _, JST) ->
    EndVoteApp.Controller =
      showResult: ->
        voteModel = new Backbone.Model MyApp.request("voting:current")

        view = new EndVoteApp.ResultView
          model: voteModel

        MyApp.mainRegion.show view

    MyApp.commands.setHandler 'endVote', ->
      MyApp.vent.trigger 'endVote'
      EndVoteApp.Controller.showResult()

  , JST
