Rails.application.routes.draw do
  root 'students#index'
  devise_for :users

  resources :students do
    resources :lessons
  end

  resources :lessons

end
