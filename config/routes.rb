Rails.application.routes.draw do
  get 'session/login'

  get 'session/logout'

  post 'session' => 'session#create'

  get 'users/new'

  get 'registration'=>'users#new'
  post 'users' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :question do
    resources :answers
  end
  root 'question#index'
end
