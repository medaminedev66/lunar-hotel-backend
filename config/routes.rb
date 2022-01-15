Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, path: 'users',
                     path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :rooms, only: %i[create index show update destroy]
      resources :reservations, only: %i[create index show update destroy]
    end
  end
end
