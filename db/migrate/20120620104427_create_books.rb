class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :ISBN_10
      t.string :authors
      t.string :pages
      t.string :weight

      t.timestamps
    end
  end
end
