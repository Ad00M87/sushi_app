Rails.application.routes.draw do

  devise_for :users
  resources :sushi_rolls

  root 'sushi_rolls#index'
end
