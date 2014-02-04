class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.float :press
      t.float :spectator
      t.string :link

      t.timestamps
    end
  end
end
