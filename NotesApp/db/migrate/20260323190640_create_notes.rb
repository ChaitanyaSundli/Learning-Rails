class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :message
      t.boolean :is_pinned
      t.datetime :reminder_at

      t.timestamps
    end
  end
end
