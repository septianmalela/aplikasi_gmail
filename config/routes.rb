Rails.application.routes.draw do
  resources :post_attachments
  resources :email_users
  devise_for :users
  root 'email_users#index'
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
