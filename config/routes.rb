Rails.application.routes.draw do
  root to: "users#homepage"
  get "signout" => "sessions#destroy"
  post "sign_in" => "users#sign_in"
  get "sign_in_page" => "users#sign_in_page"
  get "users/:user_id/profile" => "users#profile"
  resources :sessions
  resources :users do
    resources :events
  end
  resources :events do
    resources :posts do
      resources :comments
    end
  end
end
