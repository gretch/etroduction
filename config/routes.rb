ActionController::Routing::Routes.draw do |map|

  map.root :controller => "home", :action => "index"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.register "register", :controller => "users", :action => "new"
  map.make_etroduction "make_etroduction", :controller => "messages", :action => "new"
  map.share_opportunity "share_opportunity", :controller => "opportunities", :action => "new"
  map.inbox "inbox", :controller => "messages", :action => "index"
  map.connections "connections", :controller => "friends", :action => "index"

  map.resources :opportunities, :collection => {:manage => :get}, :member => {:published => :post, :unpublished => :post}

  map.resources :categories

  map.resource :profile, :controller => "users"

  map.resources :users, :as => 'profiles', :member => {:make_admin => :post}

  map.resource :user_session

  map.resources :comments

  map.resources :messages

  map

  map.rpx_login "rpx_login", :controller => 'user_sessions', :action => 'create'
end
