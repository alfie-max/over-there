class ClientsController < ApplicationController
  
  def index
    @postcode = Postcode.find(params[:id])
    c = Client.new
    @clients = c.search_venues_by_tip(:ll => "#{@postcode.latitude},#{@postcode.longitude}", :query => 'hipster', :limit => 20)
  end

end