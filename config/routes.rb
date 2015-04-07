Rails.application.routes.draw do
  root_to: 'static_pages#root'
  resources :users
  resource :session
end
