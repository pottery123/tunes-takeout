Rails.application.routes.draw do
  #
   root "suggestions#index"
   post "suggestions/combination" => "suggestions#combination"

   post "/favorites/favorite_a_suggestion" => "favorites#favorite_a_suggestion"


   get "favorites/get_my_favs" => "favorites#get_my_favs", as: :get_my_favs

   delete "/favorites/favorite_a_suggestion" => "favorites#favorite_a_suggestion"
   delete "favorites/destroy" => "favorites#destroy", as: :unfavorite




   get "/auth/:provider/callback" => "sessions#create"
   delete "/logout" => "sessions#destroy"
  # delete "/favorites/unfavorite" => "favorite#unfavorite"



   get "/suggestions/search_favorites" => "suggestions#search_favorites", as: :favorites
   #post "suggestions/business_paring" => "suggestions#business_paring"

   get "suggestions/food_music" => "suggestions#food_music", as: :list_favs


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
