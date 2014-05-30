class Postcode < ActiveRecord::Base
  attr_accessible :borough_id, :latitude, :longitude, :postcode
  belongs_to :borough

  geocoded_by :address
  after_validation :geocode
  after_create :find_borough

  def find_borough
    borough = Borough.near(self).first.id
    self.update_attributes(borough_id: borough)
  end

  def address
    "London, #{postcode}"
  end
end
