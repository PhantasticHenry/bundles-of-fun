class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :color
      t.string :size
      t.string :sku
      t.string :category

      t.timestamps
    end
  end
end
