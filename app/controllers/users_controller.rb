class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show; end
end
