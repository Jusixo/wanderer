Rails.application.routes.draw do

  resources :hosts
  resources :users
  resources :events do
    resources :photos
  end

  get 'pages/landing'
  root 'pages#landing'

  get    '/auth/:provider'          => 'omniauth#auth', as: :auth
  get    '/auth/:provider/callback' => 'session#create'
  get    '/auth/failure'            => 'session#failure'

  get '/login'  => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Shrine::DownloadEndpoint => "/attachments"
end
