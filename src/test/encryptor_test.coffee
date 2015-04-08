expect = require('chai').expect
ENCRYPTOR = require('../lib/encryptor.js')

describe 'ENCRYPTOR', ->
  message = "This is a secret message!"
  key = "secret key"

  it 'returns a string that is not the original message', ->
    string = ENCRYPTOR.encrypt message, key
    expect(string).to.not.equal(message)

