#/*global require*/
'use strict'

require.config
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    bootstrap:
      deps: ['jquery']
      exports: 'jquery'
    soundjs:
      exports: 'createjs'
  paths:
    'jquery': '../bower_components/jquery/dist/jquery'
    'backbone': '../bower_components/backbone/backbone'
    'underscore': '../bower_components/underscore/underscore'
    'bootstrap': '../bower_components/sass-bootstrap/dist/js/bootstrap'
    'marionette': '../bower_components/marionette/lib/core/amd/backbone.marionette.min'
    'backbone.wreqr': '../bower_components/backbone.wreqr/lib/amd/backbone.wreqr'
    'backbone.babysitter': '../bower_components/backbone.babysitter/lib/amd/backbone.babysitter'
    'soundjs': '../bower_components/SoundJS/lib/soundjs-0.5.2.min'

require [
  'application'
  'modules/slides/SlidesController'
  'modules/endVote/EndVoteController'
  'modules/deviceMotionInfo/DeviceMotionInfoController'
  'modules/shakeCounter/ShakeCounterController'
], (MyApp) ->
  MyApp.start()
