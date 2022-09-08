class CreateTvshows < ActiveRecord::Migration[7.0]
  def change
    create_table :tvshows do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :notes
      t.boolean :consumed
      t.boolean :starred

      t.timestamps
    end
  end
end
