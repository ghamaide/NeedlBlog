Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: [:index, :create, :new, :show, :update] do
    collection do
      get :show_update
    end
  end
end
