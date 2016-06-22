require_dependency 'admin/application_controller'

module Entity
  class CadastresController < ApplicationController
    before_action :set_cadastre

    def edit
    end
    

    def update

      unless params[:cadastre][:password_digest].present?
        params[:cadastre].delete :password_digest
        params[:cadastre].delete :password_confirmation
      end
      
      if @cadastre.update(set_params)
        flash[:success] = t :success
        redirect_to action: :edit
      else 
        render action: :edit
      end
    end

    private

    def set_params
      params.require(:cadastre).permit(:telephone, :telephone_optional,
                                       :celphone, :celphone_optional, :email,
                                       :email_optional, :foundation_date, :state_id, 
                                       :city, :cep, :address, :complement, :burgh, :number,
                                       :reference_point, :color, :password_digest, 
                                       :password_confirmation,:convenant_number)

    end

    def set_cadastre
      @cadastre = Entity::Cadastre.find(current_user.id)
    end
  end
end