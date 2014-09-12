Rails.application.routes.draw do
  resources :activity_logs

  resources :device_groups

  resources :devices

  resources :urls

  resources :internal_settings

  resources :email_accesses

  resources :profiles

  resources :mobile_user_apps

  resources :group_profiles

  resources :groups

  resources :mobile_users

  resources :roles

  resources :wallpapers

  resources :ringtones

  get 'dashboard/index'

  match '/dashboard/pushnotify' => 'dashboard#pushnotify', via: :post

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  namespace :api do
    namespace :v1 do
      match 'mdm/checkin' => 'mdm#checkin', via: :get
      match 'mdm/server' => 'mdm#server', via: :get
      match 'registration' => 'registration#login', via: :post
    end
  end

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