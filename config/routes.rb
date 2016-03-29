Rails.application.routes.draw do
  root to: 'pages#home'

  resources :articles, only: [:index, :create, :new, :show] do
  end
end
