define [
  'application'
  'templates'
], (MyApp, JST) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _, JST) ->

    class VotingSlidesApp.NoItemsView extends Marionette.ItemView
      template: JST['app/scripts/modules/slider/templates/NoItems.ejs']
  , JST
