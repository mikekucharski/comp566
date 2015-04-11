class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, precision: 5, scale: 2, default: 100.00, null: false
  end
end
