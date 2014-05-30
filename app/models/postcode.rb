class Postcode < ActiveRecord::Base
  attr_accessible :borough_id, :latitude, :longitude, :postcode
  belongs_to :borough

  geocoded_by :postcode
  after_validation :geocode

  def find_borough
    borough = Borough.near(self).first.id
    self.update_attributes(borough_id: borough)
  end
end
