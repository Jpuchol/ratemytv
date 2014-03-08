class AddSenscritiqueToFilms < ActiveRecord::Migration
  def change
    add_column :films, :senscritique, :string
  end
end
