ActionController::Routing::Routes.draw do |map|
  map.resources :biznames

  map.resources :qualities

  
  map.resources :authors
  map.resources :users
  map.resources :jobs  
  map.resource :session
  map.resources :payments, :member => { :mark_as_payed => :post }

  
    map.namespace :admin do |admin|
      # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)

      admin.resources :users

      admin.resources :projects do |project|
        project.resources :jobs, :controller => "project_jobs"
      end
    end



  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'

  map.author_signup '/author_signup', :controller => 'authors', :action => 'new'
  map.client_signup '/client_signup', :controller => 'clients', :action => 'new'

  map.ayudanos '/ayudanos-encontrar-un-nombre-de-negocio', :controller => 'biznames', :action => 'index'

  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.account_home_distributor '/account/home_distributor', :controller => 'account/home_distributor', :action => 'index'
  map.account_home_author '/account/home_author', :controller => 'account/home_author', :action => 'index'
  map.home_admin '/admin/home_admin', :controller => 'admin/home', :action => 'index'
    
  map.root :controller => 'welcome'



  map.resource :account, :collection => { :validate => :get } do |account|

      account.resources  :invited_authors, :controller => "account/my_authors", :collection => { :previous => :get }
      account.resources  :texts, :controller => "account/author_texts", :collection => { :authors_texts => :get, :previous => :get }
      account.resource   :avatar,   :controller => "account/avatars"




      # trips.resources  :offered_trips, :controller => "account/offered_trips", :collection => { :previous => :get }, :as => :offered do |offered_trips|
      #   offered_trips.resources :bookings do |booking|
      #     booking.resource :rating, :controller => "account/ratings"
      #   end
      # end




    # account.resource   :home_author,     :controller => "account/home_author"
    # account.resource   :home_distributor,  :controller => "account/home_distributor"

    # account.resource   :avatar,   :controller => "account/avatars"
    # account.resource   :password, :controller => "account/passwords", :member => { :forgotten => :get, :reset => :post }
    # 
    # account.trips "trips", :controller => "account/trips", :action => "index"
    # account.with_options :path_prefix => "account/trips" do |trips|
    #   trips.resources  :offered_trips, :controller => "account/offered_trips", :collection => { :previous => :get }, :as => :offered do |offered_trips|
    #     offered_trips.resources :bookings do |booking|
    #       booking.resource :rating, :controller => "account/ratings"
    #     end
    #   end
    #   trips.resources  :booked_trips,  :controller => "account/booked_trips", :collection => { :previous => :get }, :as => :booked do |booked_trips|
    #     booked_trips.resources :bookings do |booking|
    #       booking.resource :rating, :controller => "account/ratings"
    #     end
    #   end
    #   
    #   account.resources :payments, :controller => "account/payments"
    # end
    # 
    # account.ratings "ratings", :controller => "account/ratings", :action => "index"
    # account.with_options :path_prefix => "account/ratings" do |trips|
    #   trips.resources  :given_ratings,    :controller => "account/given_ratings", :as => :given
    #   trips.resources  :received_ratings, :controller => "account/received_ratings", :as => :received
    # end
  end


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
