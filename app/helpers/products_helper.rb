require 'openssl'
require 'base64'

module ProductsHelper

  def get_affiliate_code(product, user)
    text = product.id.to_s + '-' + user.id.to_s
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = CipherKey
    cipher.iv = CipherIv
    encrypted = cipher.update(text)
    encrypted << cipher.final
    encoded = Base64.urlsafe_encode64(encrypted, padding: false)
    return encoded
  end

  def decode_affiliate_code(code)
    decoded = Base64.urlsafe_decode64(code)
    decipher = OpenSSL::Cipher.new('AES-256-CBC')
    decipher.decrypt
    decipher.key = CipherKey
    decipher.iv = CipherIv
    decrypted = decipher.update(decoded)
    decrypted << decipher.final
    return decrypted
  end
end
