(function() {
  var ENCRYPTOR, expect;

  expect = require('chai').expect;

  ENCRYPTOR = require('../lib/encryptor.js');

  describe('ENCRYPTOR', function() {
    var key, message;
    message = "This is a secret message!";
    key = "secret key";
    return it('returns a cypher that is not the original message', function() {
      var cypher;
      cypher = ENCRYPTOR.encrypt(message, key);
      expect(cypher).to.be.a('string');
      return expect(cypher).to.not.equal(message);
    });
  });

}).call(this);
