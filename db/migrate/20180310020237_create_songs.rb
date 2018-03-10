class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.float :length
      t.string :genre
      t.integer :bpm
      t.string :mood

      t.timestamps
    end
  end
end
