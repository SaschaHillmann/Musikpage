class Album < ActiveRecord::Base
  attr_accessible :artist_id, :genre_id, :id, :name, :cover, :user_id

  belongs_to :user
  belongs_to :artist 
  belongs_to :genre
  has_many :tracks

end
