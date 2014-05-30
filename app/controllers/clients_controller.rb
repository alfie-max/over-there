class ClientsController < ApplicationController
  
  def index
    c = Client.new
    @clients = c.search_venues_by_tip(:ll => '51.5224405,-0.1094789', :query => 'hipster', :limit => 20)
  end

end