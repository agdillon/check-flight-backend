Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :avails
  end

  post 'avails/search', action: :search, controller: 'avails'

  resources :airports, only: [:index, :show]
  get 'users/:id/airports', action: :get_airports, controller: 'airports'
  put 'users/:id/airports', action: :put_airports, controller: 'airports'

  # signup and authentication
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
end
