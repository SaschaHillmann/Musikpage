class Genre < ActiveRecord::Base
  attr_accessible :id, :name

  has_many :albums
  
end
