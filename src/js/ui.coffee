validateEncryptForm = ->
  $('.error p').remove()
  $('.error').children().unwrap()
  if $('.message-area').val() == ''
    error '.message-area', 'You must enter a message!'
    return false
  if $('.secret-key-input').val() == ''
    error '.secret-key-input', 'You must enter a secret key!'
    return false

error = (field, message) ->
  $(field).wrap( $('<div>').addClass('error') )
  $(field).parent().prepend( $('<p>').append(message) )
