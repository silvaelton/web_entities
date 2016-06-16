require_dependency 'portal/application_controller'

module Portal
  class EntitiesController < ApplicationController
    
    has_scope :by_cnpj
    has_scope :by_acronym
    
    def index
      @entities = apply_scopes(Entity::Cadastre).all.order(:name)
    end
    
    def search_cpf
      @member = Entity::Member.find_by_cpf(params[:by_cpf]) rescue nil
    end
    

    def show
      @entity = Entity::Cadastre.find(params[:id])
    end
  end
end