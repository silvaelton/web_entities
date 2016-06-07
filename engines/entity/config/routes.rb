Entity::Engine.routes.draw do
  root 'dashboard#index'

  resources :entities, only: [:edit, :update], path: 'entidade'
  
  resources :members,     path: 'membros'
  resources :directories, path: 'diretoria'
  resources :passwords,   path: 'senha'
  resources :sessions,    path: 'acesso'
end
