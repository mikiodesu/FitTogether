Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
  resources :workouts
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/mypage', to: 'users#show', as: 'mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
