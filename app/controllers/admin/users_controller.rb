class Admin::UsersController < ApplicationController
  layout "admin"

  def index
    @users = User.order(id: :asc).all
  end

  def show
    @user = User.find(params[:id])
  end
end
