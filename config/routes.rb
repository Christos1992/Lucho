Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


resources :parents, only:[:new, :create, :edit, :show, :update, :destroy, :calendar] do
  get "dashboard"
  resources :children, only:[:new, :create, :edit, :update, :destroy, :show] do
    resources :child_medications, only:[:new, :create, :edit, :update, :destroy, :show]
  end
    resources :incidents do
      resources :side_effect_incidents do
        resources :side_effects
      end
    end
  end


end
