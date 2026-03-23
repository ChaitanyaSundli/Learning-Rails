class CreateClubMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :club_members do |t|
      t.references :student, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true
      t.string :role
      t.string :status

      t.timestamps
    end
  end
end
