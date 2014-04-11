define [
  'application'
  'templates'
], (MyApp, JST) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _, JST) ->
    index = 1

    class VotingSlidesApp.OptionView extends Marionette.ItemView
      template: JST['app/scripts/modules/slides/templates/Option.ejs']

      attributes: ->
        class: -> VotingSlidesApp.RandomClass.getClass()
        'data-option': => @model.get('name')
        'data-rank': => @model.get('rank')

      getCollection: ->
        collection = new Backbone.Collection()
        _.each @model.get('ranks'), (item, index) =>
          m = new Backbone.Model(
            rank: item
            name: @model.get('name')
          )
          collection.add(m)

        collection

      getInnerSwiper: =>
        view = new VotingSlidesApp.OptionsView
          collection: @getCollection()
          class: 'nested'
          index: (-> index++)()

        view.render().el

      render: ->
        if @model.get('deep') is true
          return this.$el.html(@getInnerSwiper())

        Marionette.ItemView.prototype.render.call @, arguments
  , JST
