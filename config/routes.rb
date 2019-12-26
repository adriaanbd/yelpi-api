Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :sessions, only: [:create]
    resources :users, only: [:show, :create, :update, :destroy]
    resources :patients, except: [:new, :edit] do
      resources :vitals
      resources :medications
    end
  end
end
