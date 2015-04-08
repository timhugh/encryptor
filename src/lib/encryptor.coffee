CRYPTOJS = require('../vendor/aes.js')

ENCRYPTOR =
  encrypt: (message, key) ->
    CRYPTOJS.AES.encrypt(message, key).toString()

module.exports = ENCRYPTOR
