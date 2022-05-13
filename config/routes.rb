Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :users, only: [:show] do
          resources :posts, only: [:show] do
			      resources :comments, only: [:create]
          end
        end
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
			resources :comments, only: [:destroy, :create]
			resources :likes, only: [:create]
		end
  end
end
