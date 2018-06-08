Rails.application.routes.draw do
  resources :rebreathers do
    resources :sensors
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
