MotivateMe::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :goals
  resources :groups
  resources :activities
  resources :users
end