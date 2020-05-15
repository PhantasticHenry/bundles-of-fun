class CreatePoProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :po_products do |t|
      t.belongs_to :purcahse_order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
