class PostcodesController < ApplicationController
  
  def create
    @postcode = Postcode.new(params[:postcode])

    respond_to do |format|
      if @postcode.save
        format.html { redirect_to @postcode}
      else
        format.html { render 'main#index'}
      end
    end
  end

  def show
    @postcode = Postcode.find(params[:id])
    c = Client.new
    @clients = c.search_venues_by_tip(:ll => "#{@postcode.latitude},#{@postcode.longitude}", :radius => 1000,:query => 'hipster', :limit => 20)
  end

end
