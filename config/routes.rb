Rails.application.routes.draw do
  resources :rebreathers do
    resources :sensors
  end
end
