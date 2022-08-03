class AddBudgetRefToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :budgets, :group, null: false, foreign_key: true
  end
end
