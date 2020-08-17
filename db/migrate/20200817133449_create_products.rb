class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.string :description
      t.integer :daily_price

      t.timestamps
    end
  end
end
