FitnessApp::Application.routes.draw do


  resources :weight_records


  resources :exercise_instructions


  resources :personal_bests


  resources :components


  resources :activities do
    member do
      put 'move/:direction', to: 'activities#move_in_list', as: 'move_in_list'
    end
  end


  resources :workouts do
    member do
      put 'release', to: "workouts#release"
      put 'complete', to: "workouts#complete"
      put 'make_under_construction', to: "workouts#make_under_construction"
    end
  end


  resources :connections do
    member do
      get 'list_workouts', to: "connections#list_workouts"
    end
  end


  resources :exercises


  get '/users', to: "users#index", as: 'users'


  devise_for :users

root :to => "workouts#index"
get '/list', to: "exercises#list", as: 'list'
get '/workout_constructor', to: "workouts_constructor#index"

end
