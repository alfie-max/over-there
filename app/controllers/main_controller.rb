class MainController < ApplicationController
  
  def index
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

      end
    end
  end

end
