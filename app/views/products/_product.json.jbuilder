
code = user_signed_in? ?
      get_affiliate_code(product, current_user) : ''

json.extract! product, :id, :name, :quantity, :created_at
json.code code
json.photo product.get_photo_url
json.url product_url(product, format: :json)

