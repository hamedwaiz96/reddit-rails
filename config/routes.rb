Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:new, :create, :show, :index, :edit, :update] do
    resources :posts, only: [:new]
  end
  resources :posts, only: [:show, :create, :edit, :update, :destroy]
end
