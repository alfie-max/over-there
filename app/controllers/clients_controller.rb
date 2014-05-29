class ClientsController < ApplicationController
  
  def index
    c = Client.new
    @clients = c.search_venues(:ll => '51.5224405,-0.1094789', :query => 'hipster')
  end

end