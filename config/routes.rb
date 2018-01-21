Rails.application.routes.draw do
  devise_for :users
  
  # resources :posts, :artworks do
  # 	resources :comments, only: [:create, :destroy]
  # end

  resources :posts do
    resources :comments, module: :posts
  end

  resources :artworks do
    resources :comments, module: :artworks
  end

  resources :users, only: [:show, :index]

  # resources :posts do
  # 	resources :comments
  # end
  # resources :artworks do
  # 	resources :comments
  # end


  root 'posts#index' #set site to default to posts
end
