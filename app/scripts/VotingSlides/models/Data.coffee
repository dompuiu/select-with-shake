define [
  'underscore'
  'jquery'
  'backbone'
  'marionette'
  'application'
], (_, $, Backbone, Marionette, Application) ->
  Application.MyApp.module "Voting.Data", (VotingSlides, MyApp, Backbone, Marionette, $, _) ->
    API =
      getData: ->
        sneaks = @getSneaks()
        ranks = @getRanks()

        _.each sneaks, (item, index) ->
          item.ranks = ranks
          item.deep = true

        sneaks

      getSneaks: ->
        sneaks = []

        $('#selectsneak option').map ->
           sneaks.push(name: $(this).text())

        return sneaks

      getRanks: ->
        ranks = []

        $('#selectrank option').map ->
           ranks.push($(this).text())

        return ranks

    MyApp.reqres.setHandler "votinglides:data", ->
      API.getData();
