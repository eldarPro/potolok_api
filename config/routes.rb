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
      post :change_contour
      post :change_cloth
      post :divide_contour
      get  :get_data
      get  :contours
    end
  end

  resources :contours

  resources :cloths

  resources :lusters

  resources :additional_services
 
  resources :price_lists do 
    collection do
      get :count_elements
      get :defaults
    end
  end

end
