
require_dependency 'admin/application_controller'

module Admin
  class EntitiesController < ApplicationController
    before_action :set_cadastre, only: [:enabled, :disabled]
    before_action :set_list

    def index
    end

    def enabled
      @list_cadastre = @list.list_cadastres.new
      @list_cadastre.cadastre_id = @cadastre.id
      @list_cadastre.save 
    end

    def disabled
      @list_cadastre = @list.list_cadastres.find_by_cadastre_id(@cadastre.id)
      @list_cadastre.destroy
    end


    private

    def set_cadastre
      @cadastre = Entity::Cadastre.find(params[:entity_id])
    end

    def set_list
      @list = Entity::List.find(params[:list_id])
      @cadastres = Entity::Cadastre.all.order(:name)
    end

  end
end