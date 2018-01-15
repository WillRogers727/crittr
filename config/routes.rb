Rails.application.routes.draw do
  devise_for :users
  resources :posts

  root 'posts#index' #set site to default to posts
end
