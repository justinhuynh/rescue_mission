Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, except: :destroy
end
