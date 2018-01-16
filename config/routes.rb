Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  	resources :comments
  end


  root 'posts#index' #set site to default to posts
end
