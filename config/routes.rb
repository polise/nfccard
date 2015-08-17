Rails.application.routes.draw do

  #root 'nfc_urls#show'
  #get '/:id' => 'nfc_urls#shower' as: :nfc_urls

#  get 'nfc_urls/:id' => 'nfc_urls#shower', :as => :nfc_url
     # get 'nfc_urls/:id', to: 'nfc_url#shower', as: :shower, constraints: { # 

     #   nfc_url: /\d{1,2,3}/
     # }



  resources :nfc_urls do

    #To add a route to the collection:
    collection do
      get :chooser

    end

    # add a member route, allows it to recognise /nfc_urls/no/shower 
    #with GET, and route to the shower action of nfc_urls controller, 
    #with the resource id value passed in params(:id), also should create 
    #shower_nfc_url_url and shower_nfc_url_path helpers
     member do 
       get 'shower'
     end

    #
  
 
    #resources :random_url, :weather_url, :geo_url    
    #resources :weather_url
  end



  get 'welcome/index'

  root to: 'welcome#index'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   # root 'welcome#index'

   # resources :weather_urls do

   #    root ''

   # end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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


