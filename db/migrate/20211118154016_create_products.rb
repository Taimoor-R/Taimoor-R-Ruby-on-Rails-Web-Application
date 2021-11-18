class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image_url, default: "https://commercial.bunn.com/img/image-not-available.png"
      t.decimal :price, default: 0.00
      t.integer :supply, null: false, default: 1

      t.timestamps
    end
  end
end
