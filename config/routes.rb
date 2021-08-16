Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'pages#index'
resources :users, except: [:new]

resources :articles
get 'about', to: 'pages#about'
get 'signup', to: 'users#new'
end
