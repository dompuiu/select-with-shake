define [
  'application'
], (MyApp) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _) ->

    class VotingSlidesApp.VoteModel extends Backbone.Model
      initialize: ->
        @set('sneak', $('#selectsneak').val())
        @set('rank', $('#selectrank').val())

        @on
          "change:sneak": @sneakUpdate
          "change:rank": @rankUpdate

      sneakUpdate: (model, value) ->
        $('#selectsneak').val(value)

      rankUpdate: (model, value) ->
        $('#selectrank').val(value)

      getData: ->
        sneaks = @getSneaks()
        ranks = @getRanks()

        _.each sneaks, (item, index) ->
          item.ranks = ranks
          item.deep = true

        sneaks

      getSneaks: ->
        sneaks = []

        $('#selectsneak option').map () ->
           sneaks.push(name: $(this).text())

        return sneaks

      getRanks: ->
        ranks = []

        $('#selectrank option').map () ->
           ranks.push($(this).text())

        return ranks
