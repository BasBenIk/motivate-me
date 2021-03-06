MotivateMe::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :friendships
  resources :completions
  resources :groups do
    resources :goals do
      member do
        get :reset
      end
    end
    member do
      get :leave
    end
  end
  resources :activities
  resources :users do
    get :goals
  end
end