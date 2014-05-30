class BoroughsController < ApplicationController

  # Boroughs controller added only for purpose of working out partials.
  # Should be deleted afterwards.
  
  def index
    @boroughs = Borough.all
  end

  def show
    @borough = Borough.find(params[:id])
  end
end
