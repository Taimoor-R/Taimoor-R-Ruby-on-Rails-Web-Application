class CreateCatagories < ActiveRecord::Migration[5.2]
  def change
    create_table :catagories do |t|
      t.string :Type, null: false

      t.timestamps
    end
  end
end
