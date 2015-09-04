Rails.application.routes.draw do
  resources :tacks
  devise_for :users
  root 'tacks#index'
  get 'about' => 'pages#about'
end
