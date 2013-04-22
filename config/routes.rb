MotivateMe::Application.routes.draw do
  resources :friendships

  resources :goals


  resources :groups


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end