class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.text :notes
      t.boolean :starred
      t.boolean :consumed

      t.timestamps
    end
  end
end
