Rails.application.routes.draw do

  resources :hosts
  resources :users
  resources :events do
    resources :photos do
      member do
        post 'favorite'
        post 'unfavorite'
      end
    end
  end

  get 'pages/landing'
  root 'pages#landing'

  get    '/auth/:provider'          => 'omniauth#auth', as: :auth
  get    '/auth/:provider/callback' => 'session#create'
  get    '/auth/failure'            => 'session#failure'

  get '/login'  => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get '/signup' => 'admins#new'
  post '/admins' => 'admins#create'

  get  '/signin'   => 'admin_session#new'
  post '/signin'   => 'admin_session#create'
  get  '/signout'  => 'admin_session#destroy'

  get '/send_mail' => 'user_mail#send_mail', as: :send_mail

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Shrine::DownloadEndpoint => "/attachments"
end
