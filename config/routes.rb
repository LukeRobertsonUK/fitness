FitnessApp::Application.routes.draw do


  resources :weight_records


  resources :exercise_instructions


  resources :personal_bests


  resources :components


  resources :activities


  resources :workouts


  resources :connections


  resources :exercises


  devise_for :users

root :to => "exercises#index"
end
