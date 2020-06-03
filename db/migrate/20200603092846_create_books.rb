class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :title

      t.belongs_to :bookshelf, foreign_key: true

      t.timestamps
    end
  end
end
