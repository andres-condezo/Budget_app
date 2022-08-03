class UpdateForeignkey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :budgets, :groups
    add_foreign_key :budgets, :groups, on_delete: :cascade
  end
end
