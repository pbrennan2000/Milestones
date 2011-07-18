class HomeController < ApplicationController
  def index
  end

  def home
    respond_to do |format|
      format.mobile {render :action => :index, :layout => false}
    end
  end
  
  def about
    respond_to do |format|
      format.mobile {render :layout => false}
    end
  end
  
end
