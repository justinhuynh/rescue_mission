Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, except: :destroy do
    resources :answers
  end
end
