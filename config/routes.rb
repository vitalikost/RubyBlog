Rails.application.routes.draw do
  resources :welcome
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :question do
    resources :answers
  end
  root 'question#index'
end
