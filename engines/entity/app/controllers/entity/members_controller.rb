require_dependency 'admin/application_controller'

module Entity
  class MembersController < ApplicationController
    before_action :set_member, only: [:edit, :update, :destroy]

    has_scope :by_cpf
    has_scope :by_name
    has_scope :by_situation

    def index
      @members = apply_scopes(current_user.members).all
    end

    def new
      @member = current_user.members.new
    end

    def create
      @member = current_user.members.new(set_params)

      if @member.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @member.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy

      if @member.destroy
        flash[:success] = t :success
      else
        flash[:danger]  = t :dange
      end

      redirect_to action: :index
    end
      
    private

    def set_params
      params.require(:member).permit(:name, :cpf, :rg, :born, :born_state_id, :born_city, :telephone, :celphone, :email, 
                                     :email_optional, :state_id, :city, :cep, :address, :complement, :work_state_id, 
                                     :work_city, :work_cep, :work_address, :work_complement, :work_telephone,
                                     :work_telephone_optional, :situation)
    end

    def set_member
      @member = current_user.members.find(params[:id])
    end
  end
end 