Rails.application.routes.draw do

  mount Admin::Engine   => '/admin'
  mount Entity::Engine  => '/gestao'
  mount Portal::Engine  => '/'
end
