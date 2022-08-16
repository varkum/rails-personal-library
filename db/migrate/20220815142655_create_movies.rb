class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :notes
      t.boolean :starred
      t.boolean :consumed

      t.timestamps
    end
  end
end
