class CreateSushiRolls < ActiveRecord::Migration[5.1]
  def change
    create_table :sushi_rolls do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name, null: false 
      t.float :price, null: false
      t.integer :roll_count, null: false
      t.boolean :spicy, null: false, default: false
      t.string :fish, null: false
      t.string :wrap, null: false
      t.text :description

      t.timestamps
    end
  end
end
