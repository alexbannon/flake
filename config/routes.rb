# Just another case where newlines to break up logical sections greatly
# improves readability
Rails.application.routes.draw do
  root to: "users#homepage"

  get "search_results" => "searches#user_search"
  get "signout" => "sessions#destroy"

  # you should add these as member routes on the users resources, so you get
  # nice path helpers like user_profile_path, and user_changepw_path
  get "users/:user_id/profile" => "users#profile"
  put "users/:user_id/changepw" => "users#changepw"

  resources :sessions

  # you have two resources for events... nested in users and not nested...
  # do you need both? it seems you only use this nested form in one place
  # specifically the edit link in the sidebar
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

  resources :friendships
end
