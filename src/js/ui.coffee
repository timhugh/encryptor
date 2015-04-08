$ ->
  $('#encrypt-button').click(submitForm)

submitForm = ->
  if !validateEncryptForm()
    return
  $('.share-link').val(encryptMessage)
  $("#pane1").hide()
  $("#pane2").show()

validateEncryptForm = ->
  $('.error p').remove()
  $('.error').children().unwrap()
  if $('.message-area').val() == ''
    error '.message-area', 'You must enter a message!'
    return false
  if $('.secret-key-input').val() == ''
    error '.secret-key-input', 'You must enter a secret key!'
    return false
  true

error = (field, message) ->
  $(field).wrap( $('<div>').addClass('error') )
  $(field).parent().prepend( $('<p>').append(message) )

encryptMessage = ->
  message = $('.message-area').val()
  key = $('.secret-key-input').val()

  window.location.origin + "/decode.html?key=" + encryptor.encrypt(message, key)
