class MainController < ApplicationController
  
  def index
    @postcode = Postcode.new
  end

  def show
  end

  def search_zoopla
    respond_to do |format|
      @request = 'W149AB'

      if @request && @request > ""
        @postcode = @request.downcase.tr(" ", "+")

        url ="http://api.zoopla.co.uk/api/v1/average_sold_prices.json?postcode=#{postcode}&output_type=outcode&area_type=postcodes&api_key=#{ENV['ZOOPLA_API_KEY']}"
        html = HTTParty.get(url)
        @hash = JSON(html)
        @areas = @hash['areas']
        @prices = @areas.map { |area| area['average_sold_price_1year'].to_i }

        @sum = @prices.inject{|sum,x| sum + x}
        @length = @prices.length
        @sort = @prices.sort

        @median = (@sort[(@length - 1) / 2] + @sort[@length / 2]) / 2.0
        @average = @prices / @length
      end
    end
  end

end
