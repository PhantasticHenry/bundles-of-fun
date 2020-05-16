class CreatePoProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :po_products do |t|
      t.integer :quantity
      t.belongs_to :purchase_order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
