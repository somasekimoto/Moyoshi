Rails.application.routes.draw do
  devise_for :users
  # get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show

  root to: "posts#index"

  namespace :posts do
    resources :searches, only: :index
  end


  resources :posts do
    resources :comments, only: :create
  end

  get 'tags/:tag', to: 'posts#index', as: :tag
  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'
end
