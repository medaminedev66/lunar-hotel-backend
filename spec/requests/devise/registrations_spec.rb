require 'swagger_helper'

RSpec.describe 'devise/registrations', type: :request do
  path '/users/signup' do
    post('create registration') do
      tags 'User Registration'
      consumes 'application/json'
      parameter name: :signup, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[name email password]
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
