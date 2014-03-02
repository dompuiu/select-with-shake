define [
  'require'
  'application'
  'templates'
  './models/Data'
  './models/Vote'
  './models/SwiperClass'
  './models/RandomClass'
  './views/NoItems'
  './views/Sneak'
  './views/Sneaks'
], (require, MyApp, JST) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _, JST) ->

    VotingSlidesApp.Controller =
      showSlider: ->
        voteModel = new VotingSlidesApp.VoteModel()

        MyApp.vent.on 'sneakChange', (sneak, rank) ->
          voteModel.set 'sneak', sneak
          voteModel.set 'rank', rank

        view = new VotingSlidesApp.SneaksView
          collection: new Backbone.Collection MyApp.request("voting:options")
          class: 'parent'

        MyApp.mainRegion.show view


  , JST
