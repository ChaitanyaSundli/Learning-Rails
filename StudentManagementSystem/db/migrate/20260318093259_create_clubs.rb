class CreateClubs < ActiveRecord::Migration[8.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.references :teacher, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
