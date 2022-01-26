require 'swagger_helper'

RSpec.describe 'devise/sessions', type: :request do
  path '/users/login' do
    post('create session') do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response(200, 'successful') do
        let(:login) { { email: 'admin@admin.com', password: '2435647' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:login) { { email: 'admin@admin.com', password: '2435' } }
        run_test!
      end
    end
  end

  path '/users/logout' do
    delete('delete session') do
      tags 'Sessions'
      security [bearer_auth: []]
      response(200, 'successful') do
        response '201', 'Logged Out' do
          let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
          run_test!
        end

        response '401', 'authentication failed' do
          let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
          run_test!
        end
      end
    end
  end
end
