class HomeController < ApplicationController
  def index
  end

  def about
    respond_to do |format|
      format.mobile {render :layout => false}
    end
  end
  
end
