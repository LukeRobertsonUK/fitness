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


  resources :workouts


  resources :connections


  resources :exercises


  get '/users', to: "users#index", as: 'users'


  devise_for :users

root :to => "exercises#index"
get'/list', to: "exercises#list", as: 'list'
end
