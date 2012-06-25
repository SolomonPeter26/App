class User < ActiveRecord::Base
  attr_accessible :username
  validates :username, :presence => true
  
  has_and_belongs_to_many :books
  def self.authenticate(username)
    user=User.find_by_username(username)
    return user if user
  end

end

