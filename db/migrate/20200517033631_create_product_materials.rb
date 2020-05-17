class CreateProductMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :product_materials do |t|
      t.integer :quantity
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
