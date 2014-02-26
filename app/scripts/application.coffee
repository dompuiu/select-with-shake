define [
  'marionette'
], (Marionette) ->
  window.MyApp = MyApp = new Marionette.Application()

  MyApp.addRegions
      mainRegion: '#main-region'

  MyApp.commands.setHandler 'reload', ->
    location.reload()

  MyApp.on 'initialize:after', ->
    MyApp.VotingApp.Slides.Controller.showSlider()
