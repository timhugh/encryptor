(function() {
  var ENCRYPTOR, expect;

  expect = require('chai').expect;

  ENCRYPTOR = require('../lib/encryptor.js');

  describe('ENCRYPTOR', function() {
    var key, message;
    message = "This is a secret message!";
    key = "secret key";
    it('returns a cypher that is not the original message', function() {
      var cypher;
      cypher = ENCRYPTOR.encrypt(message, key);
      expect(cypher).to.be.a('string');
      return expect(cypher).to.not.equal(message);
    });
    it('can decrypt a cypher that it has encrypted', function() {
      var cypher, decrypted_message;
      cypher = ENCRYPTOR.encrypt(message, key);
      decrypted_message = ENCRYPTOR.decrypt(cypher, key);
      return expect(decrypted_message).to.equal(message);
    });
    return it('can not decrypt a cypher with the wrong key', function() {
      var cypher, decrypted_message;
      cypher = ENCRYPTOR.encrypt(message, key);
      decrypted_message = ENCRYPTOR.decrypt(cypher, "incorrect key");
      return expect(decrypted_message).to.not.equal(message);
    });
  });

}).call(this);
