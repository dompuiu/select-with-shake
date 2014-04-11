define [
  'application'
], (MyApp) ->
  MyApp.module "VotingApp.Data", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _) ->
    optionSelect = $('#selectoption')
    rankSelect = $('#selectrank')

    API =
      getCurrent: ->
        option: optionSelect.val()
        rank: rankSelect.val()

      getData: ->
        options = @getOptions()
        ranks = @getRanks()

        _.each options, (item, index) ->
          item.ranks = ranks
          item.deep = true

        options

      getOptions: ->
        options = []

        $('option', optionSelect).map ->
           options.push(name: $(this).text())

        options

      getRanks: ->
        ranks = []

        $('option', rankSelect).map ->
           ranks.push($(this).text())

        ranks

    MyApp.reqres.setHandler "voting:current", ->
      API.getCurrent()

    MyApp.reqres.setHandler "voting:options", ->
      API.getData()
