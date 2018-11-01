Rails.application.routes.draw do
	
    
	get 'users/home' => 'users#home'
	get 'users/login' => 'users#login'
	
	post 'users/login' => 'users#check'
	delete 'users/login' => 'users#logout'
	root 'static_page#home'
   


  	resources :gossips
  	resources :users



end

