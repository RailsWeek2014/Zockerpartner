Rails.application.routes.draw do

  post '/games' => 'game_users#delete', as: 'delete_game_from_user'

  get 'game_user/search' => 'game_users#search', as: 'search'

  post 'game_user/search_result' => 'game_users#search_result', as: 'result'

  #post '/profiles/edit' => 'profiles#edit_profile', as: 'edit_current_user_profile'

  resources :user_comments

  get '/comments/:id, :user', to: 'comments#view', as: 'usercomments'

  # get 'comments/:id, :game_user_id, :game_user_id', to: 'comments#new', as: 'addcomment'

  resources :comments

  resources :friends, only: [:index, :destroy]

  get 'welcome/index'

  resources :home

  resources :game_users

  resources :ratings, only: :update

  resources :games

  resources :profiles

  devise_for :users

  get 'game_user/add_user/:id' => 'game_users#add_user' , as: 'add_user'

  get 'game/add_game/:id' => 'games#add_game' , as: 'add_game'

  root to: "welcome#index"


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
