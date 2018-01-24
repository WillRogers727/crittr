Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  
  # resources :posts, :artworks do
  # 	resources :comments, only: [:create, :destroy]
  # end

  resources :posts do
    resources :comments, module: :posts do
      # member do
      #   put "like", to: "comments#upvote"
      #   put "dislike", to: "comments#downvote"
      # end
    end
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  resources :artworks do
    resources :comments, module: :artworks do
      # member do
      #   put "like", to: "comments#upvote"
      #   put "dislike", to: "comments#downvote"
      # end
    end
    member do
      put "like", to: "artworks#upvote"
      put "dislike", to: "artworks#downvote"
    end
  end

  resources :comments do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
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
