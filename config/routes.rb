Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: %i[index create show destroy] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: %i[destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
