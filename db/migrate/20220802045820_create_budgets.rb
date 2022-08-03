class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name, :nil => false
      t.integer :amount, :default => 0, :nil => false

      t.timestamps
    end
  end
end
