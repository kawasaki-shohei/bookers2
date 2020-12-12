Rails.application.routes.draw do
  root 'home#top'
  get 'home/about', to: 'home#about'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  resources :users, only: [:show]
end
