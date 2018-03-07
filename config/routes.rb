Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root 'pages#home' #set site to default to the new home page

  resources :categories, shallow: true do 
    
    resources :posts
    get 'posts/tags/:tag', to: 'posts#index', as: 'post_tag'
    
    resources :artworks do
      resources :pictures
      member do
        patch 'create_picture'

      end
    end

    get 'artworks/tags/:tag', to: 'artworks#index', as: 'artwork_tag'
  end #end of categories
  
  
  resources :posts do

    resources :comments, module: :posts do
    end
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
      put 'set_completed' #put is used to update values
    end
  end

  resources :artworks do
    resources :reviews
    resources :comments, module: :artworks do
    end
    member do
      put "like", to: "artworks#upvote"
      put "dislike", to: "artworks#downvote"
      patch 'create_picture'
      put 'set_completed' #put is used to update values
    end
  end 
  
   resources :comments do #is this needed??
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
    end
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end


  resources :conversations do
    resources :messages
  end
  
  resources :relationships, only: [:create, :destroy]


  #should this be inside picture? - probably
  resources :notes, only: [:new, :create, :destroy]

end
