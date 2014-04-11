define [
  'require'
  'application'
  'templates'
  './models/Data'
  './models/Vote'
  './models/SwiperClass'
  './models/RandomClass'
  './views/NoItems'
  './views/Option'
  './views/Options'
], (require, MyApp, JST) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _, JST) ->

    VotingSlidesApp.Controller =
      showSlider: ->
        voteModel = new VotingSlidesApp.VoteModel()

        MyApp.vent.on 'optionChange', (option, rank) ->
          voteModel.set 'option', option
          voteModel.set 'rank', rank

        view = new VotingSlidesApp.OptionsView
          collection: new Backbone.Collection MyApp.request("voting:options")
          class: 'parent'

        MyApp.mainRegion.show view


  , JST
