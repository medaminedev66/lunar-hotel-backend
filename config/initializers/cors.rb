Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000', 'localhost:3001' '127.0.0.1:3000'
    resource '*', headers: :any, methods: [:get, :post, :delete, :options, :head]
  end
end
