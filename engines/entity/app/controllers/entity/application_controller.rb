module Entity
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception


    before_action :authenticate!

    helper_method :current_user, :user_signed_in?

    private

    def authenticate!
      unless user_signed_in?
        redirect_to entity.new_session_path if !session_controller?
      end
    end

    def current_user
      Entity::Cadastre.find(session[:entity_user_id]) rescue nil
    end

    def user_signed_in?
      current_user.present?
    end

    def session_controller?
      controller_name == "sessions"
    end

  end
end
