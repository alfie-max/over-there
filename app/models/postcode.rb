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

  def check_place(options = {})
    client = GooglePlaces::Client.new("AIzaSyAiaOsGTOdOJvqbj3_vi4icujRP-6h6ZPE")

    client.spots(latitude, longitude, options.merge({radius: 1000}))
  end

  def count_high_street_coffee
    coffee_shops = ["starbucks", "nero", "eat", "pret", "costa", "dunkin"]
    shop_count = []
    coffee_shops.each do |shop|
      shop_count << check_place(name: shop, types: "cafe").count
    end
    shop_count.inject(0, :+)
  end

  def count_high_street_bikes
    bike_shops = ["evans", "surgery", "halfords"]
    shop_count = []
    bike_shops.each do |shop|
      shop_count << check_place(name: shop, types: "bicycle_store").count
    end
    shop_count.inject(0, :+)
  end

end
