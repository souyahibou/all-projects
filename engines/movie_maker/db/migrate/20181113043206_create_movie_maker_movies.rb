class CreateMovieMakerMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_maker_movies do |t|
      t.string :title
      t.integer :release_year

      t.timestamps
    end
  end
end
