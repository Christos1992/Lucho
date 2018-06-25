Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

resources :parents, only:[:new, :create, :edit, :show, :update, :destroy] do
    resources :childs, only:[:new, :create, :edit, :update, :destroy] do
      resources :childmedications
    end
  end
end
