CaledonianPlace::Application.routes.draw do

  resources :postings
  
  resources :meetings

  resources :suggestions

  root to: 'meetings#future'
  
  match '/future_meetings' => 'meetings#future'
  match '/past_meetings' => 'meetings#past'
  match '/new_meeting',  to: 'meetings#new'
  match '/running_meetings',  to: 'meetings#running'
  match '/adopt_suggestion',  to: 'meetings#adopt'
  match '/book_group_suggestions',  to: 'suggestions#book_group'
  match '/read_only_suggestions',  to: 'suggestions#read_only'
  match '/theme_suggestions',  to: 'suggestions#theme'
  match '/new_suggestion',  to: 'suggestions#new'
  match '/contact', to: 'static_pages#contact'  
  match '/print_future_meetings', to: 'meetings#print'
  match '/postings',  to: 'postings#index'
  match '/new_posting',  to: 'postings#new'
  match '/christmas', to: 'static_pages#christmas_theme'


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
