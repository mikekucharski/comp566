class AddForeignKeys < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer, null: false
	  add_foreign_key :orders, :users

	  add_column :order_products, :order_id, :integer, null: false
	  add_foreign_key :order_products, :orders

	  add_column :order_products, :product_id, :integer, null: false
	  add_foreign_key :order_products, :products

	  add_column :products, :brand_id, :integer, null: false
	  add_foreign_key :products, :brands

	  add_column :products, :category_id, :integer, null: false
	  add_foreign_key :products, :categories
  end
end
