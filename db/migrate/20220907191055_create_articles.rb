class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.text :notes
      t.string :url
      t.boolean :consumed
      t.boolean :starred

      t.timestamps
    end
  end
end
