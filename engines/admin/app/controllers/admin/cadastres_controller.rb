require_dependency 'admin/application_controller'

module Admin
  class CadastresController < ApplicationController
    before_action :ser_cadastre, only: [:edit, :update, :destroy, :show]
    
    has_scope :by_cnpj
    has_scope :by_acronym

    def index
      @entities = apply_scopes(Admin::Cadastre).all.order(:name)
    end

    def show
    end
    

    def new
      @entity = Admin::Cadastre.new
    end

    def create
      @entity = Admin::Cadastre.new(set_params)

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

      unless params[:cadastre][:password_digest].present?
        params[:cadastre].delete :password_digest
        params[:cadastre].delete :password_confirmation
      end
      
      if @entity.update(set_params)
        flash[:success]
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @entity.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:cadastre).permit(:acronym, :cnpj, :telephone, :telephone_optional,
                                       :celphone, :celphone_optional, :email, :name,
                                       :email_optional, :foundation_date, :state_id, 
                                       :city, :cep, :address, :complement, :burgh, :number,
                                       :reference_point, :color, :password_digest, 
                                       :password_confirmation)

    end

    def ser_cadastre
      @entity = Admin::Cadastre.find(params[:id]) rescue nil
    end
    
  end
end