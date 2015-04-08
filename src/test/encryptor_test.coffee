expect = require('chai').expect
ENCRYPTOR = require('../lib/encryptor.js')

describe 'ENCRYPTOR', ->
  message = "This is a secret message!"
  key = "secret key"

  it 'returns a cypher that is not the original message', ->
    cypher = ENCRYPTOR.encrypt message, key
    expect(cypher).to.be.a('string')
    expect(cypher).to.not.equal(message)

  it 'can decrypt a cypher that it has encrypted', ->
    cypher = ENCRYPTOR.encrypt message, key
    decrypted_message = ENCRYPTOR.decrypt cypher, key
