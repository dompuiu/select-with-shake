define [
  'application'
], (MyApp) ->
  MyApp.module "VotingApp.Slides", (VotingSlidesApp, MyApp, Backbone, Marionette, $, _) ->

    VotingSlidesApp.SwiperClass =
      class: ''
      index: null

      setClass: (cssClass) ->
        @class = cssClass

      setIndex: (index) ->
        @index = index

      getPrefix: () ->
        cssClass = @class
        cssClass += '-' + @index if @index?
        cssClass

      getBaseClass: (prefix) ->
        prefix + '-' + @class

      getUniqueClass: (prefix) ->
        cssClass = @getBaseClass(prefix)
        cssClass += '-' + @index if @index?
        cssClass

      getUniqueSelector: (prefix) ->
        '.' + @getUniqueClass(prefix)

      getFullClass: (prefix) ->
        @getBaseClass(prefix) + ' ' + @getUniqueClass(prefix)
