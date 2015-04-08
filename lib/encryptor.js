(function() {
  var CRYPTOJS, ENCRYPTOR;

  CRYPTOJS = require('../vendor/aes.js');

  ENCRYPTOR = {
    encrypt: function(message, key) {
      return CRYPTOJS.AES.encrypt(message, key).toString();
    },
    decrypt: function(cypher, key) {
      return CRYPTOJS.AES.decrypt(cypher, key);
    }
  };

  module.exports = ENCRYPTOR;

}).call(this);
