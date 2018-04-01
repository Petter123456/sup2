Rails.application.routes.draw do

root 'main_pages#index'


get '/index' => 'suppliers#index'
get '/page1' => 'main_pages#page_1', as: "page1"
post '/page1' => 'main_pages#page_1'


get'/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/signup' => 'users#new'
post '/signup' => 'users#create'


post '/confirm_order_and_email' => 'main_pages#confirm_order_and_email'
get '/confirm_order_and_email' => 'main_pages#confirm_order_and_email'


get '/check_for_current_user' => 'main_pages#check_for_current_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
