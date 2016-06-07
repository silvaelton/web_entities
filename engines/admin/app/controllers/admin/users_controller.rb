require_dependency 'admin/application_controller'

module Admin
  class UsersController < ApplicationController
    
    def index
    end

    def new
      @entity = Entity::Cadastre.new
    end

    def create
      @entity = Entity::Cadastre.new(set_params)

      if @entity.save
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_params
    end

    def set_entity
    end
    
  end
end