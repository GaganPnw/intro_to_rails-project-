class AddDownloadsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :downloads, :integer
  end
end
