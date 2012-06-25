class Book < ActiveRecord::Base
  attr_accessible :ISBN_10, :authors, :pages, :title, :weight
  has_and_belongs_to_many :users
end

