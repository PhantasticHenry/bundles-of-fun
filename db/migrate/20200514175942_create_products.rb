class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.string :size
      t.string :sku
      t.string :category

      t.timestamps
    end
  end
end
