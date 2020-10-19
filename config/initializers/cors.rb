# Be sure to restart your server when you modify this file.

# Allow CORS to all origins
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      :headers => :any,
      :methods => [
        :get,
        :post,
        :put,
        :delete,
        :head,
        :options
      ],
      :expose => [
        'Content-Range',
        'access-token',
        'client',
        'uid'
      ]
  end
end

