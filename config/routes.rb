Rails.application.routes.draw do
  root to: "users#homepage"
  get "signout" => "users#signout"
  post "sign_in" => "users#sign_in"
  get "sign_in_page" => "users#sign_in_page"
  resources :users do
    resources :events
  end
  resources :events do
    resources :posts do
      resources :comments
    end
  end
end
