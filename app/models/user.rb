class User < ActiveRecord::Base
  attr_accessible :username
  validates :username, :presence => true
  
  def self.authenticate(username)
    user=find_by_username(username)
    return user if user && user.authenticated?(username)
  end
  
  def authenticated?(username)
    self.username == username
  end
end
