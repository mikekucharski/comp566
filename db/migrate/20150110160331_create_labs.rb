class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
