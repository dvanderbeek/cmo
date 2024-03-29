Cms::Application.routes.draw do
  resources :blocks

  resources :cols

  resources :rows

  resources :site_resources

  devise_for :users
  resources :sites
  resources :pages
  post 'pages/sort', :as => :sort_pages
  post 'site_resources/sort', :as => :sort_site_resources
  post 'rows/sort', :as => :sort_rows
  post 'blocks/update_all', :as => :update_all_blocks
  post 'blocks/sort', :as => :sort_blocks
  match 'robots.txt' => 'sites#robots'


  # constraints(Subdomain) do
    # #page_routes.call
    # match '/' => 'sites#show'
    # match '/edit' => 'sites#edit'
  # end
  match '', to: 'pages#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  match '/edit', to: 'pages#edit', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  match '/edit_layout', to: 'sites#edit_layout', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  match '/update_layout.:id', to: 'sites#update_layout', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, :as => :layout
  get '/:id', to: 'pages#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, :as => :page
  put '/:id', to: 'pages#update', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, :as => :update_page
  delete '/:id', to: 'pages#destroy', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, :as => :destroy_page
  match '/:id/edit', to: 'pages#edit', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }, :as => :edit_page

  get "home/index"
  get "home/plans"
  get "home/features"
  get "home/about"
  get "home/support"
  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
