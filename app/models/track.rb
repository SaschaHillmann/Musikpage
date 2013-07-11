class Track < ActiveRecord::Base
  attr_accessible :album_id, :id, :name
  belongs_to :album

end
