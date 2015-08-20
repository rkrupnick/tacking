Rails.application.routes.draw do
  resources :tacks
  devise_for :users
  root 'pages#home'
  get 'about' => 'pages#about'
end
