Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :sessions, only: [:create]
    resources :users, only: [:show, :create, :update, :destroy] do
      resources :observed_patients, module: :users, only: [:index, :show]
    end
    resources :patients, except: [:new, :edit] do
      resources :vitals
      resources :medications
      resources :observations, only: [:create]
    end
  end
end
