class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :author_name
      t.integer :birth_year

    end
  end
end
