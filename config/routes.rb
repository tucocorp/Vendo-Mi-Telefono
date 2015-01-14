Rails.application.routes.draw do
  resources :companies

  devise_for :users

  resources :users do
    get  'lock'
    get  'unlock'
  end

  resources :buys do
    get  'add_customer', on: :member
    post 'create_customer', on: :member
    get  'add_phone', on: :member
    post 'create_buy_details', on: :member
    post 'print_coupon', on: :member
    
    #collection { post :search, to: 'buys#buy_sucursal' }
  end

  resources :coupons

  resources :buy_details



  resources :customers do
    #collection { post :search, to: 'customers#index' }
    #get 'page/:page', :action => :index, :on => :collection

  end

  resources :models

  resources :trademarks do
  
  end


  resources :states
  resources :sucursals
  resources :members
  

  get 'welcome/index'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get   'quote_phones'      => 'sell_phones#quote_phone'
  post  'calculate_price'   => 'sell_phones#calculate_price'
  post  'generate_buy'      => 'sell_phones#generate_buy'
  get   'add_customer'      => 'sell_phones#add_customer'
  # post  'create_customer'   => 'sell_phones#create_customer'
  get   'finalize_buy/:id'  => 'sell_phones#finalize_buy'
  get   'buy_sucursal'      => 'buys#buy_sucursal'
  get   'buy_all'           => 'buys#buy_all'
  #get 'refresh_models/:trademark_id' => 'sell_phones#refresh_models' 

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
