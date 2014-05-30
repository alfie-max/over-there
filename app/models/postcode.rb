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

  def ranking
    ranking = 0

    if self.count_high_street_coffee < 10
      ranking += 1
    end

    if self.count_high_street_bikes > 5
      ranking += 1
    end

    if self.check_place(types: "restaurant", keyword: "vegan").count > 1
      ranking += 1
    end

  end

  def check_place(options = {})
    client = GooglePlaces::Client.new("AIzaSyAdLAXTikKNuiFqSGdFA2SDpw28jQs8zl8")

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

  def instagram
    min_timestamp = 1.week.ago.to_time.to_i
    max_timestamp = Time.new.to_time.to_i
    distance = 1000
    url = "https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&min_timestamp=#{min_timestamp}&max_timestamp=#{max_timestamp}&distance=#{distance}&access_token=8035257.052c85c.fbc9ded6488c44e2a7be19a7687bb6e7"
    @hash = HTTParty.get(url)["data"] rescue nil
    @hash || {}
  end

  def growth_average
    return @growth_average if @growth_average
    search_zoopla
    @growth_average
  end

  def growth_median
    return @growth_median if @growth_median
    search_zoopla
    @growth_median
  end

  private
  def search_zoopla
    ps = postcode.to_s.downcase.tr(" ", "+")

    url ="http://api.zoopla.co.uk/api/v1/average_sold_prices.json?postcode=#{ps}&output_type=outcode&area_type=postcodes&api_key=ckj3rw3k4hjh3xhtptht52ab"
    response = HTTParty.get(url)
    areas = response['areas'] rescue nil
        
    prices = areas.map { |area| area['average_sold_price_1year'].to_i }
    five_year_prices = areas.map { |area| area['average_sold_price_5year'].to_i }

    sum_1_year = prices.inject{|sum,x| sum + x}
    length_1_year = prices.length
    sort_1_year = prices.sort
    sum_5_year = five_year_prices.inject{|sum,x| sum + x}
    length_5_year = five_year_prices.length
    sort_5_year = five_year_prices.sort

    median_1_year = (sort_1_year[(length_1_year - 1) / 2] + sort_1_year[length_1_year / 2]) / 2.0
    average_1_year = sum_1_year / length_1_year
    median_5_year = (sort_5_year[(length_5_year - 1) / 2] + sort_5_year[length_5_year / 2]) / 2.0
    average_5_year = sum_5_year / length_5_year

    @growth_average = ((((average_5_year - average_1_year).to_f) / average_1_year.to_f) * 100).round(2)
    @growth_median = ((((median_5_year - median_1_year).to_f) / median_1_year.to_f) * 100).round(2)
  end

end
