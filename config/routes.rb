Myapp::Application.routes.draw do

  namespace :visitor do
    resources :users, only: [:show] do
      member do
        get :home
      end
    end
    resources :goods, only: [:index, :show]
  end

  namespace :me do
    resources :users do
      member do
        get :home
      end
    end
  end

  namespace :admin do
    resources :goods
  end

  resource :login
end
