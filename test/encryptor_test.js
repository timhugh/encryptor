(function() {
  var ENCRYPTOR, expect;

  expect = require('chai').expect;

  ENCRYPTOR = require('../lib/encryptor.js');

  describe('ENCRYPTOR', function() {
    var key, message;
    message = "This is a secret message!";
    key = "secret key";
    return it('returns a string that is not the original message', function() {
      var string;
      string = ENCRYPTOR.encrypt(message, key);
      return expect(string).to.not.equal(message);
    });
  });

}).call(this);
