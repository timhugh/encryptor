var addErrorMessage, decryptMessage, displayDecryptedMessage, encryptMessage, removeErrors, switchPanes, validateDecryptForm, validateEncryptForm, validateFields;

$(function() {
  $('#encrypt-button').click(function() {
    if (!validateEncryptForm()) {
      return;
    }
    $('#share-link').val(encryptMessage);
    switchPanes('#pane1', '#pane2');
    $('#share-link').select();
    return $('#share-link').click(function() {
      return $(this).select();
    });
  });
  $('#decrypt-button').click(function() {
    switchPanes('#pane1', '#pane2');
    if (!validateDecryptForm()) {
      switchPanes('#pane2', '#pane1');
      return;
    }
    return setTimeout(displayDecryptedMessage, 500);
  });
  return $(document).keydown(function(e) {
    if (e.keycode === 13) {
      $('#encrypt-button').click();
      return $('#decrypt-button').click();
    }
  });
});

displayDecryptedMessage = function() {
  var message;
  message = decryptMessage();
  if (message === "") {
    switchPanes('#pane2', '#pane1');
    return addErrorMessage('#secret-message', 'Incorrect key');
  } else {
    switchPanes('#pane2', '#pane3');
    return $('#secret-message').append(message);
  }
};

validateDecryptForm = function() {
  var errorMessages;
  removeErrors();
  errorMessages = {
    '#secret-key-input': 'You must enter your secret key'
  };
  return validateFields(errorMessages);
};

validateEncryptForm = function() {
  var errorMessages;
  removeErrors();
  errorMessages = {
    '#message-area': 'You must enter a message',
    '#secret-key-input': 'You must enter a secret key'
  };
  return validateFields(errorMessages);
};

validateFields = function(errorMessages) {
  var fieldName;
  for (fieldName in errorMessages) {
    if ($(fieldName).val() === '') {
      addErrorMessage(fieldName, errorMessages[fieldName]);
      return false;
    }
  }
  return true;
};

switchPanes = function(pane1, pane2) {
  $(pane1).hide();
  return $(pane2).show();
};

removeErrors = function() {
  $('.error p').remove();
  return $('.error').children().unwrap();
};

addErrorMessage = function(field, message) {
  $(field).wrap($('<div>').addClass('error'));
  return $(field).parent().prepend($('<p>').append(message));
};

encryptMessage = function() {
  var key, message;
  message = $('#message-area').val();
  key = $('#secret-key-input').val();
  return window.location.href + '/decode.html?key=' + encryptor.encrypt(message, key);
};

decryptMessage = function() {
  var cypher, key, startOfCypher;
  key = $('#secret-key-input').val();
  startOfCypher = window.location.href.indexOf('=') + 1;
  cypher = window.location.href.slice(startOfCypher);
  return encryptor.decrypt(cypher, key);
};

//# sourceMappingURL=index.js.map
