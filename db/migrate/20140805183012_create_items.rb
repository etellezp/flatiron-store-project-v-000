class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :inventory
      t.integer :price
      t.string :title
    end
  end
end
