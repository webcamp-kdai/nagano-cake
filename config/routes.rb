Rails.application.routes.draw do

  namespace :public do
    get 'cart_items/index'
  end
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'

    root 'public/homes#top'
    get "/about" => "public/homes#about",as:"about"


  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }

  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:"public/sessions"
  }

  namespace :admin do
    resources:genres,only:[:create,:index,:edit,:update]
    resources:items,only:[:index,:new,:create,:show,:edit,:update]
    resources:customers,only:[:index,:show,:edit,:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
