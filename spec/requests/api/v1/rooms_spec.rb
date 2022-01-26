require 'swagger_helper'
RSpec.describe 'api/v1/rooms', type: :request do
  # rubocop: disable Metrics
  path '/api/v1/rooms' do
    get('list rooms') do
      tags 'Rooms'
      security [bearer_auth: []]

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

      response '201', 'Authorized' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end

    post 'create room' do
      tags 'Rooms'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          city: { type: :string },
          rate: { type: :integer },
          room_type: { type: :string },
          amenities: { type: :string },
          picture: { type: :string }
        },
        required: %w[name city rate room_type amenities picture]
      }

      response '201', 'room created' do
        let(:room) do
          { name: 'foo', city: 'rio', rate: 23, room_type: 'basic', amenities: 'In-room games', picture: 'image.jpg' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:room) { { name: 'foo', city: 'rio', rate: 23, amenities: 'In-room games', picture: 'image.jpg' } }
        run_test!
      end

      response '201', 'successfully authenticated' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end

      response(201, 'successful') do
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

  path '/api/v1/rooms/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show room') do
      tags 'Rooms'
      security [bearer_auth: []]
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '201', 'successfully authenticated' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end

    delete('delete room') do
      tags 'Rooms'
      security [bearer_auth: []]
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '201', 'delete room' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('admin@admin.com:2435647')}" }
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) { "Bearer #{::Base64.strict_encode64('bogus:bogus')}" }
        run_test!
      end
    end
  end
  # rubocop: enable Metrics
end
