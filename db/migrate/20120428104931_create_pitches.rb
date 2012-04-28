class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
