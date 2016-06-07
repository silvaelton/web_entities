require_dependency 'entity/application_controller'

module Entity
  class SessionsController < ApplicationController
    layout 'entity/application-less'

    def new
      @session = Entity::Session.new
    end

    def create
      @session = Entity::Session.new(set_params)

      if @session.valid?
        session[:entity_user_id] = @session.id
        redirect_to entity.root_path
      else
        render action: :new
      end
    end

    def logout
      session[:entity_user_id] = nil
      redirect_to entity.new_session_path    
    end
    
    private

    def set_params
      params.require(:session).permit(:cnpj, :password)
    end
    
  end
end