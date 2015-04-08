(function() {
  validateEncryptForm(function() {
    if ($('.message-area').val() === "") {
      error('.message-area', 'You must enter a message!');
      return false;
    }
    if ($('.secret-key-input').val() === "") {
      error('.secret-key-input', 'You must enter a secret key!');
      return false;
    }
  });

  error(function(field, message) {
    return $(field).wrap($("div").addClass("error").prepend("<p>" + message + "</p>"));
  });

}).call(this);

//# sourceMappingURL=ui.js.map
