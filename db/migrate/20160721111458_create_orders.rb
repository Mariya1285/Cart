class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :total_cost
      t.string :status, default: 'placed'

      t.timestamps null: false
    end
  end
end
