Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  post 'users/:user_id/posts', to: 'posts#create' # create
  post 'users/:user_id/posts/:post_id', to: 'comments#create', as: 'new_comment' # comments create
  post 'users/:user_id/posts/:post_id/like', to: 'likes#create', as: 'new_like' # likes create
  delete 'users/:user_id/posts/:post_id', to: 'posts#delete', as: 'delete_post'
	delete 'delete/users/:user_id/posts/:id/comment/:comment_id', to: 'comments#delete', as: 'delete_comment'         
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end
end
