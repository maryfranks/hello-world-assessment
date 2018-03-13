Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :replies, except: [:index, :new, :show]
  end
  resource :user

end
