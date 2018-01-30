Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root 'pages#home' #set site to default to the new home page
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
      put 'set_answered' #put is used to update values
    end
  end   

  resources :artworks do
    resources :comments, module: :artworks do
      # member do
      #   put "like", to: "comments#upvote"
      #   put "dislike", to: "comments#downvote"
      # end
    end
    resources :pictures
    member do
      put "like", to: "artworks#upvote"
      put "dislike", to: "artworks#downvote"
      patch 'create_picture'
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


end
