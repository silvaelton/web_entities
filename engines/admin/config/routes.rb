Admin::Engine.routes.draw do

  root 'cadastres#index'

  resources :cadastres, path: 'entidades'
  resources :users,     path: 'usuário'
  resources :profile,   path: 'perfil'
  resources :lists,     path: 'listas'

  resources :sessions do 
    collection { delete 'logout' }
  end
end
