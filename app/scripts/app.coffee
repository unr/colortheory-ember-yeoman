App = window.App = Ember.Application.create()

# Order and include as you please.
# require('scripts/routes/*')
# require('scripts/controllers/*')
# require('scripts/models/*')
# require('scripts/views/*')

App.Router.map ->
  # routes here


App.IndexRoute = Ember.Route.extend
  model: -> ['red', 'yellow', 'blue']




# STARTING COLOR TEST.
$ ->
  Color = window.Color = net.brehaut.Color

  default_color = "#ff9900"

  phases = 5
  hueDistance = 20
  hueShift = hueDistance / phases

  maxSaturation = 50
  saturationShift = maxSaturation / phases / 100

  maxBrightness = 30
  brightnessShift = maxBrightness / phases / 100

  color1 = Color(default_color)
  colors = []


  # hue = color1.getHue()
  # saturation = color1.getSaturation()
  # lightness = color1.getLightness()

  i = 0
  while i <= phases-1
    if i is 0
      colors[0] = color1
    else
      # grab previous color
      color = colors[i-1].shiftHue(hueShift).desaturateByAmount(saturationShift)
      colors[i] = color


    i++


  # build color boxes, for demo purposes
  for color in colors
    colorstring = color.toString()
    $('.colors').append("<div class='color' style='background: #{colorstring}'></div>")


  console.log colors
