require_dependency 'admin/application_controller'

module Admin
  class SessionsController < ApplicationController
    layout 'admin/application-less'

    before_action :redirect_if_user_signed, only: [:new, :create]

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

    def logout
      session[:admin_user_id] = nil
      redirect_to admin.new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:email, :password)
    end

    def redirect_if_user_signed
      redirect_to admin.root_path if user_signed_in?
    end
    
  end
end