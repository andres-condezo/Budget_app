class BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :remember_page, only: %i[index show]

  def show
    @current_group = Group.find(params[:group_id])
    @user = current_user
  end

  def create
    @budget = current_user.budgets.new(budget_params)
    @budget.group_id = params[:group_id]
    @budget.save
    redirect_to group_path(params[:group_id])
  end

  def new
    @current_group = params[:group_id]
    @budget = Budget.new
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :amount)
  end
end
