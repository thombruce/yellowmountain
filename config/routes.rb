Rails.application.routes.draw do
  require 'constraints/short_dispatcher'
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions", invitations: "users/invitations" }
  namespace :admin do
    resources :users
    resources :organizations, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :domains, :id => /[^\/]+/, only: [:index, :new, :edit, :create, :update, :destroy]
    # /[A-Za-z0-9\.\-]+/ # an underscores?
    resources :mailboxes, :id => /[^\/]+/, only: [:index, :new, :edit, :create, :update, :destroy]
    # /[A-Za-z0-9\.@\-\_]+/
    resources :blog_posts, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :pages, only: [:index, :new, :edit, :create, :update, :destroy]
    get '/' => 'dashboard#index'
  end
  resources :users, only: [:index, :show]
  resources :blog_posts, path: 'blog', only: [:index, :show]
  resources :pages, only: [:index, :show]

  match '/contact', to: 'contact#create', :via => 'post', :as => 'emails'

  match '/:id', to: Constraints::ShortDispatcher.new(self), :via => 'get', :as => 'vanity'
  root 'home#index'
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
