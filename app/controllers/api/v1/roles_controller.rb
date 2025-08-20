class Api::V1::RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show; end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      render :show, status: :created
    else
      flash_error(@role.errors.full_messages.to_sentence)
    end
  end

  def edit; end

  def update
    if @role.update(role_params)
      render :show, status: :ok
    else
      flash_error(@role.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @role.destroy
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end

  def flash_error(message)
    flash[:error] = message
  end
end
