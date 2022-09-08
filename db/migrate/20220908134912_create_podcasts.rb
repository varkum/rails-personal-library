class CreatePodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :podcast
      t.string :url
      t.text :notes
      t.boolean :consumed
      t.boolean :starred

      t.timestamps
    end
  end
end
