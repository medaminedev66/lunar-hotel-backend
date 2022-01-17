Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'http://localhost:3000', 'http://127.0.0.1:3001', 'http://127.0.0.1:3001'
    resource '*', headers: %w(Authorization), expose: %w(Authorization), methods: :any, max_age: 600 
  end
end