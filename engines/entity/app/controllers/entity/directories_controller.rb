require_dependency 'admin/application_controller'

module Entity
  class DirectoriesController < ApplicationController
    before_action :set_directory, only: [:edit, :update, :destroy]

    has_scope :by_cpf
    has_scope :by_name
    has_scope :by_job

    def index
      @directories = apply_scopes(current_user.directories).all
    end

    def new
      @directory = current_user.directories.new
    end

    def create
      @directory = current_user.directories.new(set_params)

      if @directory.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @directory.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy

      if @directory.destroy
        flash[:success] = t :success
      else
        flash[:danger]  = t :dange
      end

      redirect_to action: :index
    end
      
    private

    def set_params
      params.require(:directory).permit(:name, :cpf, :rg, :born, :born_state_id, :born_city, :telephone, :celphone, :email, 
                                     :email_optional, :state_id, :city, :cep, :address, :complement, :work_state_id, 
                                     :work_city, :work_cep, :work_address, :work_complement, :work_telephone,
                                     :work_telephone_optional, :job)
    end

    def set_directory
      @directory = current_user.directories.find(params[:id])
    end
  end
end 