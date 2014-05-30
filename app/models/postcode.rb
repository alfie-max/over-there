class Postcode < ActiveRecord::Base
  attr_accessible :borough_id, :latitude, :longitude, :postcode
  belongs_to :borough

  geocoded_by :postcode
  after_validation :geocode

  def find_borough
    borough = Borough.near(self).first.id
    self.update_attributes(borough_id: borough)
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

    url ="http://api.zoopla.co.uk/api/v1/average_sold_prices.json?postcode=#{ps}&output_type=outcode&area_type=postcodes&api_key=#{ENV['ZOOPLA_API_KEY']}"
    response = HTTParty.get(url)
    areas = response['areas']
        
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
