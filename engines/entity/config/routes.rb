Entity::Engine.routes.draw do
  root 'members#index'

  resources :cadastres, except: :destroy, path: 'entidade'
  
  resources :members,     path: 'membros' do 
    get 'term', path: 'termo'
  end
  
  resources :directories, path: 'diretoria'
  resources :passwords,   path: 'senha'
  
  resources :sessions,    path: 'acesso' do 
    collection { delete 'logout' }
  end
end
