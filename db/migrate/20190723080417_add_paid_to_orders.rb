class AddPaidToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :paid, :boolean
  end
end
