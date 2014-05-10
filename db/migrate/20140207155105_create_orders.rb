class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :good_id, null: false
      t.integer :quantity, null: false
      t.column :state, :tinyint, default: 0
      t.string :deliver_number
      t.string :description
      t.string :comment
      t.datetime :accepted_at
      t.datetime :booked_at
      t.datetime :delivered_at
      t.datetime :received_at
      t.datetime :closed_at
      t.timestamps
    end
  end
end
