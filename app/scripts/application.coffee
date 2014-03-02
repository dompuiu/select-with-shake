define [
  'jquery'
  'marionette'
  'soundjs'
], ($, Marionette, createjs) ->
  playFirstSound = ->
    createjs.Sound.play 'init'
    window.removeEventListener 'click', playFirstSound

  initSound = (callback) ->
    loadHandler = (e) ->
      window.addEventListener 'click', playFirstSound
      $(window).trigger 'click'
      callback()

    audioPath = "./sfx/";
    manifest = [{
      id: 'shake'
      src: 'shake.ogg'
    },{
      id: 'init'
      src: 'blank.ogg'
    }]

    createjs.Sound.alternateExtensions = ['mp3'];
    createjs.Sound.addEventListener 'fileload', loadHandler
    createjs.Sound.registerManifest manifest, audioPath


  window.MyApp = MyApp = new Marionette.Application()

  MyApp.addRegions
      mainRegion: '#main-region'
      infoRegion: '#info-region'
      counterRegion: '#counter-region'

  MyApp.commands.setHandler 'reload', ->
    location.reload()

  MyApp.vent.on 'endVote', ->
    _satellite.track 'EndVote'

  MyApp.on 'initialize:after', ->
    initSound ->
      MyApp.VotingApp.Slides.Controller.showSlider()
