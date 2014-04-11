define [
  'application'
], (MyApp) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _) ->

    class VotingSlidesApp.VoteModel extends Backbone.Model
      initialize: ->
        @set('option', $('#selectoption').val())
        @set('rank', $('#selectrank').val())

        @on
          "change:option": @optionUpdate
          "change:rank": @rankUpdate

      optionUpdate: (model, value) ->
        $('#selectoption').val(value)

      rankUpdate: (model, value) ->
        $('#selectrank').val(value)

      getData: ->
        options = @getOptions()
        ranks = @getRanks()

        _.each options, (item, index) ->
          item.ranks = ranks
          item.deep = true

        options

      getOptions: ->
        options = []

        $('#selectoption option').map () ->
           options.push(name: $(this).text())

        return options

      getRanks: ->
        ranks = []

        $('#selectrank option').map () ->
           ranks.push($(this).text())

        return ranks
