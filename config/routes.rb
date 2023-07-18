Rails.application.routes.draw do

  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
  end
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    get 'customers/mypage' => 'customers#show'
    get 'customers/edit'
    resources :cart_items, only: [:index, :update, :destroy, :create], controller: "public/cart_items" do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only: [:new, :create, :index, :show], controller: "public/cart_items" do
      collection do
        post "confirm"
        get "thanks"
      end
    end
    resources :addresses, except: [:show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
