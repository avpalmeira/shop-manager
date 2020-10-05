require 'openssl'
require 'base64'

module ProductsHelper

  def get_affiliate_code(product, user)
    text = product.id.to_s + '-' + user.id.to_s
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.random_key
    cipher.random_iv
    encrypted = cipher.update(text) + cipher.final
    encoded = Base64.encode64(encrypted)
    return encoded
  end

  def decode_affiliate_code(code)
  end
end
