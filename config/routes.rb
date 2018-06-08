Rails.application.routes.draw do
  
  post 'images/create'
  
  #get 'images/new', to: 'images#new'
  get 'index', to: 'images#index'
  post 'images/search' => 'images/search', as: 'search_images'
  get 'images/:id/edit', to: 'images#edit', as: 'edit_image'
  patch 'images/:id/update',to: 'images#update', as: 'update_image'
  delete 'images/:id/delete', to: 'images#delete', as: 'delete_image'

  root 'images#new', as:'new_image'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
