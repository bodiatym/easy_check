Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_in" => "devise/sessions#new"
    get "/users/sign_up" => "devise/registrations#new"
  end

  root 'static_pages#home'
  get '/home' => 'static_pages#home'
end
