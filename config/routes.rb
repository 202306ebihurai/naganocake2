Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  device_for :admin
  
   namespace :admin do
    resources :items
    resources :genres,only {index,create,edit,update}
  end
  
  
end
