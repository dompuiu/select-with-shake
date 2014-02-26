define [
  'exports'
  'underscore'
  'backbone'
  'marionette'
  'templates'
  'views/Sneaks',
  'models/RandomClass'
], (exports, Underscore, Backbone, Marionette, JST, SneaksView, RandomClass) ->
  index = 1

  exports.Sneak = class Sneak extends Marionette.ItemView
    template: JST['app/scripts/templates/Sneak.ejs']

    attributes: ->
      class: -> RandomClass.getClass()
      'data-sneak': => @model.get('name')
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
      view = new SneaksView.Sneaks
        collection: @getCollection()
        class: 'nested'
        index: (-> index++)()

      view.render().el

    render: ->
      if @model.get('deep') is true
        return this.$el.html(@getInnerSwiper())

      Marionette.ItemView.prototype.render.call @, arguments

  exports
