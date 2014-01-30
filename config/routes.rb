OTD::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#home'
  get "home/home"
  get "home/about"
  
  scope :auth, :controller => :auth, :as => :auth do
    match 'sign_in', action: :login, via: [:get, :post]
    get 'sign_out', action: :sign_out
  end
  
  scope :home, :controller => :profiles, :as => :profile do
    get 'athlete_page'
    get 'trainer_page'
    match 'update_trainer', action: :update_trainer, via: [:get, :post]
    match 'update_athlete', action: :update_athlete, via: [:get, :post]
  end
  
  scope :trainings, :controller => :trainings, :as => :trainings do
    match 'new_training', via: [:get, :post]
    match 'add_training', action: :add_training, via: [:get, :post]
    match 'training/:id', action: :show, via: [:get, :post]
    match 'remove_athlete', action: :remove_athlete, via: [:get, :post]
    match 'add_athlete', action: :add_athlete, via: [:get, :post]
    get 'fill_training/:id', action: :fill_training
    get 'trainings_history/:id', action: :trainings_history
    get 'trainer_trainings/:id', action: :trainer_trainings
  end
  
  scope :sections, :controller => :sections, :as => :sections do
    match 'add', action: :add, via: [:get, :post]
    match 'remove_section', action: 'remove_section', via: [:get, :post]
    match 'move_up', action: 'move_up', via: [:get, :post]
  end
  
  scope :groups, :controller => :groups, :as => :groups do
    match 'add_athlete', action: :add_athlete, via: [:get, :post]
  end
  
  scope :gathletes, :controller => :gathletes, :as => :gathletes do
    match 'add_athlete', action: :add_athlete, via: [:get, :post]
  end

  scope :athletes, :controller => :athletes, :as => :athletes do
    match 'new_athlete', action: :new_athlete, via: [:get, :post]
    match 'add_athlete', action: :add_athlete, via: [:get, :post]    
    match 'assign_athlete', action: :assign_athlete, via: [:get, :post]
    match 'athletes_list', action: :athletes_list, via: [:get, :post]
  end
  
  scope :remote, :controller => :remote, :as => :remote do
    match 'get_trainings', action: :get_trainings, via: [:get, :post]
  end
  
  resources :atrainings

  resources :trainers

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
