require_dependency 'portal/application_controller'

module Portal
  class EntitiesController < ApplicationController
    
    def index
      @entities = Entity::Cadastre.all.order(:name)
    end
      
    def show
      @entities = Entity::Cadastre.find(params[:id])
    end
  end
end