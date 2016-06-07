Admin::Engine.routes.draw do

  root 'dashboard#index'

  resources :entities, path: 'entidades'
  resources :users,    path: 'usuário'
  resources :profile,  path: 'perfil'

  resources :sessions
end
