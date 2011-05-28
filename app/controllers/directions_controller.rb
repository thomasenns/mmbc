class DirectionsController < ApplicationController

def new
  respond_to do |format|
  format.html # new.html.erb
  format.js
  end
end

def show
  
  @user = User.find(current_user.id)
  @route = @user.routes.find(params[:route_id])
  
  respond_to do |format|
  format.html # show.html.erb
  format.xml  { render :xml => @route }
  format.js
  end
end

end
