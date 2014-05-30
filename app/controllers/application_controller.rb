class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @instagram = Instagram.user_recent_media("22987485", {:count => 1})
  end

end
