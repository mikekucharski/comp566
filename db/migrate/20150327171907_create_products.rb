class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :imageNum, null: false
      t.integer :stock, null: false, default: 15
      t.decimal :price, precision: 5, scale: 2, null: false, default: 0.00
    end
  end
end
