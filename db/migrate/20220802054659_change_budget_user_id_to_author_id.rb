class ChangeBudgetUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :budgets, :user_id, :author_id
  end
end
