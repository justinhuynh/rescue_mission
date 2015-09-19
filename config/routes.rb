Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'questions#index'

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
end
