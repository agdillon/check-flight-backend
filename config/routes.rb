Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :avails
  end
  post 'avail/search', action: :search, controller: 'avail'
  #resources :airports only: [:index, :show]
end
