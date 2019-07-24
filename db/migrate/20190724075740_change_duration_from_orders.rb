class ChangeDurationFromOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :duration, :integer, default: 1
  end
end
