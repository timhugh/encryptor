CRYPTOJS = require('../vendor/aes.js')

ENCRYPTOR =
  encrypt: (message, key) ->
    CRYPTOJS.AES.encrypt(message, key).toString()

  decrypt: (cypher, key) ->
    CRYPTOJS.AES.decrypt(cypher, key).toString(CRYPTOJS.enc.Utf8)

module.exports = ENCRYPTOR
