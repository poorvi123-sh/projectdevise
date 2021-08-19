Rails.application.routes.draw do
  
  devise_for :users,controllers: { omniauth_callbacks: 'users/omniauth' }
  root 'posts#index'
  resources :homes
  resources :posts do
    resources :likes
    resources :comments do
    resources :likes
  end
end
end
