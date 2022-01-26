require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  # rubocop: disable Metrics
  path '/api/v1/reservations' do
    get('list reservations') do
      tags 'Reservations'
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

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          check_in: { type: :date },
          check_out: { type: :date },
          room_id: { type: :integer }
        },
        required: %w[check_in check_out room_id]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          { check_in: '2022-01-26', check_out: '2022-01-29', room_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { check_in: '2022-01-26', check_out: '2022-01-29' } }
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

  path '/api/v1/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      tags 'Reservations'
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

    delete('delete reservation') do
      tags 'Reservations'
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

      response '201', 'delete reservation' do
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
