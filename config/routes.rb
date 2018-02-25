Rails.application.routes.draw do
  resources :discussions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'discussions#index'  
  devise_for :users, controllers: {registrations: 'registrations'}



end
