Rails.application.routes.draw do
  devise_for :user
  root 'questions#index'

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end


end
