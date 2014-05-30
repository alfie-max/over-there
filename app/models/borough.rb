class Borough < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :location
  has_many :postcodes

  reverse_geocoded_by :latitude, :longitude, address: :location
  after_validation :reverse_geocode
end
