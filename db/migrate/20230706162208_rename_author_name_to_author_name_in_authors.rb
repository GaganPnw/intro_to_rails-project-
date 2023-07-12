class RenameAuthorNameToAuthorNameInAuthors < ActiveRecord::Migration[7.0]
  def change
    rename_column :authors, :name, :author_name
  end
end
