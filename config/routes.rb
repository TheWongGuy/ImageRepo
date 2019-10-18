Rails.application.routes.draw do
  root to: 'photos#index'
  resources :photos
  devise_for :users

  get '/qrcode/:id', to: 'qrcode#download', as: 'qrcode'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
