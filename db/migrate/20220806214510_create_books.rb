class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :notes
      t.boolean :starred
      t.boolean :consumed

      t.timestamps
    end
  end
end
