class RemoveTotalCostFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :total_cost, :float
  end
end
