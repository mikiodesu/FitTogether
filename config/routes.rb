Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
 
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do  #セッション情報でわかるためmemberでない(ID不要)
      get 'mypage'
      patch 'update_credentials'
    end
  end


  resources :workouts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
 
end
