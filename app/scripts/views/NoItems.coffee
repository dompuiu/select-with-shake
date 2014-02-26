define [
  'marionette'
  'templates'
], (Marionette, JST) ->
  class NoItemsView extends Marionette.ItemView
    template: JST['app/scripts/templates/NoItems.ejs']
