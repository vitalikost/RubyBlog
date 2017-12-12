Rails.application.routes.draw do
  get 'session/login'
  get 'session/logout'
  post 'session' => 'session#create'

  get 'users/new'
  get 'users/show'
  get 'registration'=>'users#new'
  post 'users' => 'users#create'

  post 'likeup' => 'question#likeup'
  post 'likedown' => 'question#likedown'

  get 'createnewanswers' => 'answers#createnew'
  post 'savenewanswers' => 'answers#create'

  post 'add' => 'users#addfavorite'
  post 'remove' => 'users#removefavorite'
  get 'favorite' => 'users#favorite'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :question do
    resources :answers
  end
  root 'question#index'
end
