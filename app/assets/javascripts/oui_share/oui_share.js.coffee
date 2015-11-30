#= require_self
#= require_tree .

window.OuiShare =
  initPage: ->
    # If you're using the Turbolinks and you need run a code only one time, put something here.
    # if you're not using the turbolinks, there's no difference between init and initPage.

  init: ->
    # Something here. This is called in every page, with or without Turbolinks.


$(document).ready ->

  if $('#slider1_container').length > 0
    jssor_slider1_starter(slider1_container)

  if $('#slider2_container').length > 0
    jssor_slider2_starter(slider2_container)

  if $('#slider3_container').length > 0
    jssor_slider3_starter(slider3_container)

  $('.eur').click (e) ->
    e.preventDefault()
    $('.eur').addClass('active')
    $('.usd').removeClass('active')
    $('.dolar').hide()
    $('.euro').show()

  $('.usd').click (e) ->
    e.preventDefault()
    $('.eur').removeClass('active')
    $('.usd').addClass('active')
    $('.euro').hide()
    $('.dolar').show()

  $('.add-contact-language').click (e) ->
    e.preventDefault()
    value = $('.contact-language-select').val()
    res = $('#user_contact_languages').val().replace('{','').replace('}','').split(',')
    if (res.indexOf(value) == -1)
      console.log res
      res.push(value)
      console.log res 
      $('#user_contact_languages').val("{"+res.toString()+"}")
      $('.contact-languages').append("<div value='"+value+"' class='contact-language-value'><span class='remove-contact-language'>x</span>" +value+ "</div>")

  $('#edit').on 'click', '.remove-contact-language', (e) ->
    value = this.parentNode.getAttribute('value')
    res = $('#user_contact_languages').val().replace('{','').replace('}','').split(',')
    res = res.splice(res, res.indexOf(value))
    $('#user_contact_languages').val("{"+res.toString()+"}")
    this.parentNode.remove()


  $('.community_events').hide()
  res_community = []
  $('#community_event_ids option:selected').each (i, selected)->
    res_community[i] = $(selected).text()
  # $('.event_community').append("<div value='"+res_community[i]+"' class='event-community-value'><span class='remove-event-community'>x</span>" +res_community[i]+ "</div>")

  $('#event_community').click (e) ->
    e.preventDefault()
    value = $('#event_community option:selected').text()
    id = $('#event_community option:selected').val()
    console.log id
    if (res_community.indexOf(value) == -1)
      res_community.push(value)
      $('#community_event_ids option[value="'+id+'"]').prop('selected', true)
      $('.event_community').append("<div value='"+value+"' class='event-community-value'><span class='remove-event-community'>x</span>" +value+ "</div>")

  $('#admin').on 'click', '.remove-event-community', (e) ->
    alert 'Not working yet ;-('
    # value = this.parentNode.getAttribute('value')
    # res = $('#user_contact_languages').val().replace('{','').replace('}','').split(',')
    # res = res.splice(res, res.indexOf(value))
    # $('#user_contact_languages').val("{"+res.toString()+"}")
    # this.parentNode.remove()
    


  remove_ctc_lang = (t) ->
    console.log(this)

  removetest = (t) ->
    console.log(test)
  

remove_ctc_lang = () ->
  console.log(this)

removetest = (t) ->
  console.log(test)

jssor_slider1_starter = (containerId) ->
  options = 
    $AutoPlay: false
    $PauseOnHover: 1
    $ArrowKeyNavigation: true
    $SlideWidth: 600
    $SlideSpacing: 0
    $DisplayPieces: 2
    $ParkingPosition: 300
    $ArrowNavigatorOptions:
      $Class: $JssorArrowNavigator$
      $ChanceToShow: 2
      $AutoCenter: 2
      $Steps: 1
    
  jssor_slider1 = new $JssorSlider$(containerId, options)
  #responsive code begin
  #you can remove responsive code if you don't want the slider scales while window resizes

  ScaleSlider = ->
    parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth
    if parentWidth
      jssor_slider1.$ScaleWidth(Math.min(parentWidth))
    else
      $Jssor$.$Delay ScaleSlider, 30
    return

  ScaleSlider()
  $Jssor$.$AddEvent window, 'load', ScaleSlider
  $Jssor$.$AddEvent window, 'resize', ScaleSlider
  $Jssor$.$AddEvent window, 'orientationchange', ScaleSlider
  #responsive code end
  return

jssor_slider2_starter = (containerId) ->
  options = 
    $AutoPlay: false
    $PauseOnHover: 1
    $ArrowKeyNavigation: true
    $SlideWidth: 400
    $SlideSpacing: 0
    $DisplayPieces: 3
    $ParkingPosition: 0
    $ArrowNavigatorOptions:
      $Class: $JssorArrowNavigator$
      $ChanceToShow: 2
      $AutoCenter: 2
      $Steps: 1
    
  jssor_slider2 = new $JssorSlider$(containerId, options)
  #responsive code begin
  #you can remove responsive code if you don't want the slider scales while window resizes

  ScaleSlider = ->
    parentWidth = jssor_slider2.$Elmt.parentNode.clientWidth
    if parentWidth
      jssor_slider2.$ScaleWidth(Math.min(parentWidth))
    else
      $Jssor$.$Delay ScaleSlider, 30
    return

  ScaleSlider()
  $Jssor$.$AddEvent window, 'load', ScaleSlider
  $Jssor$.$AddEvent window, 'resize', ScaleSlider
  $Jssor$.$AddEvent window, 'orientationchange', ScaleSlider
  #responsive code end
  return

jssor_slider3_starter = (containerId) ->
  options = 
    $AutoPlay: true
    $PauseOnHover: 1
    $ArrowKeyNavigation: true
    $SlideWidth: 400
    $SlideSpacing: 0
    $DisplayPieces: 3
    $ParkingPosition: 0
    $ArrowNavigatorOptions:
      $Class: $JssorArrowNavigator$
      $ChanceToShow: 2
      $AutoCenter: 2
      $Steps: 1
    
  jssor_slider2 = new $JssorSlider$(containerId, options)
  #responsive code begin
  #you can remove responsive code if you don't want the slider scales while window resizes

  ScaleSlider = ->
    parentWidth = jssor_slider2.$Elmt.parentNode.clientWidth
    if parentWidth
      jssor_slider2.$ScaleWidth(Math.min(parentWidth))
    else
      $Jssor$.$Delay ScaleSlider, 30
    return

  ScaleSlider()
  $Jssor$.$AddEvent window, 'load', ScaleSlider
  $Jssor$.$AddEvent window, 'resize', ScaleSlider
  $Jssor$.$AddEvent window, 'orientationchange', ScaleSlider
  #responsive code end
  return
