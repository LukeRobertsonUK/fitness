FitnessApp::Application.routes.draw do


  resources :weight_records


  resources :exercise_instructions


  resources :personal_bests


  resources :components


  resources :activities


  resources :workouts


  resources :connections


  resources :exercises


  get '/users', to: "users#index", as: 'users'


  devise_for :users

root :to => "exercises#index"
get'/list', to: "exercises#list", as: 'list'
end
