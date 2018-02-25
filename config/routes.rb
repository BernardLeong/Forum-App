Rails.application.routes.draw do
  resources :channels
  resources :discussions do
    #within discussion there is reply
    resources :replies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'discussions#index'  
  devise_for :users, controllers: {registrations: 'registrations'} #tell devise which controller to use.



end
