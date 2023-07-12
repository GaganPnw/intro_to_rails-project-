class CreateReaders < ActiveRecord::Migration[7.0]
  def change
    create_table :readers do |t|
      t.string :name
      t.integer :books_read
      t.integer :books_reading
      t.integer :books_saved

      t.timestamps
    end
  end
end
