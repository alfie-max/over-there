class ClientsController < ApplicationController
  
  def find_hipster_shit
    c = Client.new
    c.search_venues(:ll => '51.5224405,-0.1094789', :query => 'hipster')
  end