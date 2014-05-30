class Postcode < ActiveRecord::Base
  attr_accessible :borough_id, :latitude, :longitude, :postcode
  belongs_to :borough

  geocoded_by :postcode
  after_validation :geocode

  def find_borough
    borough = Borough.near(self).first.id
    self.update_attributes(borough_id: borough)
  end


  def instagram
    min_timestamp = 1.week.ago.to_time.to_i
    max_timestamp = Time.new.to_time.to_i
    distance = 1000
    url = "https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&min_timestamp=#{min_timestamp}&max_timestamp=#{max_timestamp}&distance=#{distance}&access_token=8035257.052c85c.fbc9ded6488c44e2a7be19a7687bb6e7"
    @hash = HTTParty.get(url)["data"] rescue nil
    @hash || {}
  end
end
