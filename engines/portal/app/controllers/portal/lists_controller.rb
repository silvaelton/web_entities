require_dependency 'portal/application_controller'

module Portal
  class ListsController < ApplicationController
    
    def index
      @lists = Entity::List.all.order(:name)
    end

    def show
      @list = Entity::List.find(params[:id])
    end

      
  end
end