Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  post 'users/:user_id/posts', to: 'posts#create' # create
  post 'users/:user_id/posts/:post_id', to: 'comments#create', as: 'new_comment' # comments create

  resources :users, only: [:index, :show,] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:new]
    end
  end
end
