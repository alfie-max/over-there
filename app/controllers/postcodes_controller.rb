class PostcodesController < ApplicationController
  
  def create
    user_pc = params[:postcode][:postcode]
    pc = UKPostcode.new(user_pc)
    if pc.valid?
      postcode = pc.outcode

      if Postcode.where(postcode: postcode).empty?
        @postcode = Postcode.create(postcode: postcode)

        respond_to do |format|
          if @postcode.save
            format.html { redirect_to @postcode}
          else
            format.html { render 'main#index'}
          end
        end
      else
        redirect_to postcode_path(Postcode.where(postcode: postcode).first)
      end
    else
      flash[:notice] = "Invalid postcode, try again."
      redirect_to root_path
    end
  end

  def show
    @postcode = Postcode.find(params[:id])

    @instagram = @postcode.instagram
    
    c = Client.new
    @clients = c.search_venues_by_tip(:ll => "#{@postcode.latitude},#{@postcode.longitude}", :radius => 1000,:query => 'hipster', :limit => 20)
  end

end
