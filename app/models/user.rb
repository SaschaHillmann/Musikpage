class User < ActiveRecord::Base
  attr_accessible :email, :id, :password

  has_many :albums
end
