class CreatePurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders do |t|
      t.string :po
      t.string :bin
      t.string :start_date
      t.string :completion_date

      t.timestamps
    end
  end
end
