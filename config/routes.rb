MotivateMe::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :friendships
  resources :completions
  resources :goals
  resources :groups do
    resources :goals
    member do
      get :leave
    end
  end
  resources :activities
  resources :users
end