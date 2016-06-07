Portal::Engine.routes.draw do
  root 'entities#index'

  resources :entities, only: [:index, :show], path: 'entidades' do 
    resources :members, only: [:index, :show], path: 'membros'
    resources :directories, only: [:show],     path: 'diretoria'
  end
  
  resources :lists,    only: [:index, :show], path: 'listas'
end
