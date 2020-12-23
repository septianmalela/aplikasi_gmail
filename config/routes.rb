Rails.application.routes.draw do
  devise_for :users
  root 'emails#index'
  get 'home/index'
  get 'home/show'
  resources :emails do
  member do
  	patch 'move_trash'
  	post 'move_draft'
    patch 'delete_trash'
  end 
  	 collection do
  		get 'sent'
  		get 'trash'
  		get 'draft'
  	end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
