class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user      
      redirect_to :controller => "stories", :action => "index"
    end
    
  end

  def help
  end
  
  def contact
  end
end
