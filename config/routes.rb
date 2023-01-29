Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contours#index"

  resources :users
  resources :projects do 
    member do
      get 'rooms'
    end
  end

  resources :rooms do
    member do
      post :set_data
      post :edit_title
      get  :get_data
    end
  end

  resources :contours

end
