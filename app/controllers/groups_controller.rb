class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :remember_page, only: %i[index show]

  def index
    @user = current_user
    @user_groups = @user.groups.order(created_at: :desc)
    @title = 'Categories'
  end

  def show
    @current_group = Group.find(params[:id])
    @user = current_user
    @title = 'Transactions'
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.save
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
