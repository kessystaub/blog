Rails.application.routes.draw do
  get 'search', to: "search#index"
  root "articles#index"

  resources :articles do
    resources :comments
  end
end
