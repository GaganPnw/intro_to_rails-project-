class CreateBooksSubjectsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :subjects do |t|
      t.index [:book_id, :subject_id]
      t.index [:subject_id, :book_id]
    end
  end
end
