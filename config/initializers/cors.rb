# Be sure to restart your server when you modify this file.

# Config CORS
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['ALLOW_LOCAL'],
      ENV['ALLOW_CLIENT']

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
        'content-range',
        'access-token',
        'client',
        'uid'
      ]
  end
end

