(function() {
  var CRYPTOJS, ENCRYPTOR;

  CRYPTOJS = require('../vendor/aes.js');

  ENCRYPTOR = {
    encrypt: function(message, key) {
      return CRYPTOJS.AES.encrypt(message, key).toString();
    }
  };

  module.exports = ENCRYPTOR;

}).call(this);
