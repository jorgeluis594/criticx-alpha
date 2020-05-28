Rails.application.routes.draw do

  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
