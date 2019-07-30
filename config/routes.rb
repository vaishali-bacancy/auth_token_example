Rails.application.routes.draw do


  get 'static_pages/address/:id' => 'static_pages#address', as: :view_address
  get 'static_pages/ticket/:id' => 'static_pages#ticket', as: :view_ticket
  get 'static_pages/timing/:id' => 'static_pages#timing', as: :view_timing
  get 'static_pages/details/:id' => 'static_pages#details', as: :view_details
  get 'static_pages/search' => 'static_pages#search', as: :view_search
  get 'static_pages/photos/:id' => 'static_pages#photos', as: :view_photos
  get 'static_pages/rating/:id' => 'static_pages#rating', as: :view_ratings
  root 'static_pages#new'
  devise_for :users, controllers: {
           :sessions => "users/sessions",
           :registrations => "users/registrations" }

  
	post 'tickets/search_by', to: 'tickets#search_by'
	post 'timings/search_by', to: 'timings#search_by'
  post 'pictures/search_by', to: 'pictures#search_by'
  
  resources :pages
  resources :pictures
  resources :timings
  resources :tickets
  resources :products
  resources :places
  resources :addresses
  resources :states
  resources :static_pages

  #get 'admin_homes/home' => 'admin_homes#home', as: :adminhome
  # authenticated :user do
  #   root to: 'admin_homes#home'
  # end

  #root :to => 'home#static_page'
 #post 'admin_homes/home', to: 'admin_homes#home', as: :homeeeee
  
  #post 'admin_homes/home' 
end
