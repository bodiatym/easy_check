Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_in" => "devise/sessions#new"
    get "/users/sign_up" => "devise/registrations#new"
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  root 'static_pages#home'
  get '/home' => 'static_pages#home'

  resources :questions
  resources :tests
  resources :test_assignments
  resources :answer_options_assignee_answers, only: [:create]
end
