Myapp::Application.routes.draw do

  namespace :visitor do
    get :about
    resources :users, only: [:show] do
      member do
        get :home
      end
    end
    resources :goods, only: [:index, :show] do
      collection do
        get :brand
        get :search
      end
    end
    resources :orders, only: [:index, :show]
  end

  namespace :me do
    resources :users do
      member do
        get :home
      end
      resources :orders do
        member do
          put :change_state
        end
      end
    end
  end

  namespace :admin do
    resources :goods do
      member do
        put :recache
      end
    end

    resources :orders do
      member do
        put :change_state
      end
    end
  end

  resource :login

  root :to => 'visitor#top'
end
