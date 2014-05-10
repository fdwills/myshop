class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title, null: false
      t.string :brand
      t.string :sequence_number
      t.string :choices
      t.binary :description_j
      t.binary :description_c
      t.string :source
      t.integer :price
      t.column :state, :tinyint, null: false, default: 0
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :comment
      t.timestamps
    end
  end
end
