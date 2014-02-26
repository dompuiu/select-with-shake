define [
  'exports'
  'jquery'
  'underscore'
  'backbone'
  'marionette'
  'views/Sneaks'
  'views/EndVote'
  'models/Vote'
], (exports, $, _, Backbone, Marionette, SneaksView, EndVoteView, VoteModel) ->
    window.MyApp = MyApp = exports.MyApp = new Marionette.Application()

    voteModel = new VoteModel()
    MyApp.vent.on 'sneakChange', (sneak, rank) ->
      voteModel.set 'sneak', sneak
      voteModel.set 'rank', rank

    MyApp.addRegions
        mainRegion: '#main-region'

    MyApp.commands.setHandler 'endVote', ->
      view = new EndVoteView
        model: voteModel
      MyApp.mainRegion.show view

    MyApp.commands.setHandler 'reload', ->
      location.reload()

    MyApp.on 'initialize:after', ->
      sneaksCollection = new Backbone.Collection()
      sneaksCollection.add(voteModel.getData())

      view = new SneaksView.Sneaks
        collection: sneaksCollection
        class: 'parent'

      MyApp.mainRegion.show view

    exports
