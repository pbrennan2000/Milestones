class LoginController < ApplicationController
  
  def index  
    respond_to do |format| 
      format.mobile {render :layout => false}
    end
  end
  
  def login
    respond_to do |format|
      format.mobile {render :layout => false}
    end
  end

  def logout
  end

end
