class UsersController < ApplicationController
 def show
    
	@user = User.find(current_user.id)
	@governments = Government.all 
	@routes = @user.routes.all

	@LatLngBndsSWx = -125
	@LatLngBndsSWy = -25
	@LatLngBndsNEx = 100
	@LatLngBndsNEy = 50

	respond_to do |format|
	format.html # index.html.erb
	format.xml  { render :xml => @routes }
	end  
  end
end
