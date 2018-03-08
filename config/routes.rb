Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "channels#index"
  resources :channels, only: [:index, :create, :show]  do
    resources :messages, only: [:create]
  end

  get 'authentication' => 'authentication#index'
  post 'authentication/login' => 'authentication#login'
  get 'authentication/logout' => 'authentication#logout'

  post 'pusher/auth' => 'pusher#auth'
  post '/items/:id/event/move' => 'items#move'
  put '/channels/:id' => 'channels#update'

  match "*a" => "application#render_error", via: [:get, :post]
end
