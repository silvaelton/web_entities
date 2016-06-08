Admin::Engine.routes.draw do

  root 'cadastres#index'

  resources :cadastres, path: 'entidades'
  resources :users,     path: 'usuario'
  resources :profile,   path: 'perfil'
  resources :lists,     path: 'listas' do 
    resources :entities, path: 'cadastros' do 
      get 'enabled'
      get 'disabled'
    end
  end

  resources :sessions do 
    collection { delete 'logout' }
  end
end
