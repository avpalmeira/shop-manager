json.extract! product, :id, :name, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
