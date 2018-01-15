Rails.application.routes.draw do
  resources :posts

  root 'posts#index' #set site to default to posts
end
