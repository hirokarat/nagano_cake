Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  
  get "/" => "homes#top", as: "top"
  get "/about" => "homes#about", as: "about"
  get "/customers" => "customer/customers#rule", as: "customer_rule"
  
  namespace :admin do
  
    resources:orders,only:[:index,:show,:update]
    resources:customers,only:[:index,:show,:edit,:update]
    resources:genres,only:[:index,:create,:edit,:update]
    resources:items,only:[:index,:new,:create,:show,:edit,:update]
  
    root to:'homes#top'
  end
  
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
    
    get 'customers/unsubscribe'
    get 'customers/withdtaw'
    get 'customers/information/edit'=>'customers#edit',as: 'customer_edit'
    patch "update" => "customers#update", as: "customer_update"
    get 'customers/my_page'=>'customers#show',as: 'my_page'
    root to:'homes#top'
    get 'homes/about'
  end
  
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
