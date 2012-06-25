class CreateBooksUsersJoin < ActiveRecord::Migration
  def up
        create_table 'books_users', :id => false do |t|
          t.column 'book_id', :integer
          t.column 'user_id', :integer
      end
  end

  def down
      drop_table 'books_users'
  end
end

