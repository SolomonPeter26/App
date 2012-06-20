class Book < ActiveRecord::Base
  attr_accessible :ISBN_10, :authors, :pages, :title, :weight
end
