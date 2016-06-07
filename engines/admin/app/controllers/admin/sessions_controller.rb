require_dependency 'admin/application_controller'

module Admin
  class SessionsController < ApplicationController
    
    def new
      @session = Admin::Session.new
    end


    def create
      @session = Admin::Session.new(set_params)
      if @session.valid?
        session[:admin_user_id] = @session.id
        redirect_to admin.root_path
      else
        render action: :new
      end
    end

    def destroy
      session[:admin_user_id] = nil
      redirect_to admin.new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:email, :password)
    end
    
  end
end