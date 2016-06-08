require_dependency 'admin/application_controller'

module Admin
  class ListsController < ApplicationController
    before_action :set_list, only: [:edit, :update, :destroy]

    def index
      @lists = Entity::List.all.order(:name)
    end

    def new
      @list = Entity::List.new
    end

    def create
      @list = Entity::List.new(set_params)

      if @list.save
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @list.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @list.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    
    end

    private

    def set_params
      params.require(:list).permit(:name, :description, :color)
    end

    def set_list
      @list = Entity::List.find(params[:id])
    end
    
  end
end