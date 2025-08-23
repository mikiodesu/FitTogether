Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations',
    passwords: 'admin/passwords'
  }

  namespace :admin do
    root to: 'dashboard#top'  # 管理者トップページ
    resources :users, only: [:index, :show, :destroy]
    resources :workouts, only: [:index, :destroy] do
      resources :comments, only: [:index, :destroy], controller: "workout_comments"
    end
  end

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root to: 'homes#top'
 
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]

    member do   # ← ユーザごとのページだから member
      get :followings   # /users/:id/followings
      get :followers    # /users/:id/followers
    end
  
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
