Rails.application.routes.draw do
  root to: "users#homepage"
  get "search_results" => "searches#user_search"
  get "signout" => "sessions#destroy"
  get "users/:user_id/profile" => "users#profile"
  put "users/:user_id/changepw" => "users#changepw"
  resources :sessions
  resources :users do
    resources :events
  end
  resources :events do
    member do
      get 'users'
      get 'join'
      get 'leave'
    end
    resources :posts do
      resources :comments
    end
  end
end
