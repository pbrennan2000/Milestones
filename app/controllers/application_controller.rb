class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile
  
  private
  
  def mobile_device?
  	request.user_agent =~ /Mobile|webOS/  # need to customize for other devices
  end
  helper_method :mobile_device?
  
  def prepare_for_mobile
  	request.format = :mobile if mobile_device?
  end
end
