var encryptMessage, error, removeErrors, submitForm, validateEncryptForm;

$(function() {
  return $('#encrypt-button').click(submitForm);
});

submitForm = function() {
  if (!validateEncryptForm()) {
    return;
  }
  $('.share-link').val(encryptMessage);
  $("#pane1").hide();
  return $("#pane2").show();
};

validateEncryptForm = function() {
  removeErrors();
  if ($('.message-area').val() === '') {
    error('.message-area', 'You must enter a message!');
    return false;
  }
  if ($('.secret-key-input').val() === '') {
    error('.secret-key-input', 'You must enter a secret key!');
    return false;
  }
  return true;
};

removeErrors = function() {
  $('.error p').remove();
  return $('.error').children().unwrap();
};

error = function(field, message) {
  $(field).wrap($('<div>').addClass('error'));
  return $(field).parent().prepend($('<p>').append(message));
};

encryptMessage = function() {
  var key, message;
  message = $('.message-area').val();
  key = $('.secret-key-input').val();
  return window.location.origin + "/decode.html?key=" + encryptor.encrypt(message, key);
};

//# sourceMappingURL=index.js.map
