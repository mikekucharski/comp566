class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
    	t.integer :quantity, null: false, default: 1
      t.timestamps null: false
    end
  end
end
