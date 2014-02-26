define [
  'application'
], (MyApp) ->
  MyApp.module "VotingApp.Data", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _) ->
    sneakSelect = $('#selectsneak')
    rankSelect = $('#selectrank')

    API =
      getCurrent: ->
        sneak: sneakSelect.val()
        rank: rankSelect.val()

      getData: ->
        sneaks = @getSneaks()
        ranks = @getRanks()

        _.each sneaks, (item, index) ->
          item.ranks = ranks
          item.deep = true

        sneaks

      getSneaks: ->
        sneaks = []

        $('option', sneakSelect).map ->
           sneaks.push(name: $(this).text())

        sneaks

      getRanks: ->
        ranks = []

        $('option', rankSelect).map ->
           ranks.push($(this).text())

        ranks

    MyApp.reqres.setHandler "voting:current", ->
      API.getCurrent()

    MyApp.reqres.setHandler "voting:options", ->
      API.getData()
