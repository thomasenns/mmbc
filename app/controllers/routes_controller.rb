

class RoutesController < ApplicationController
  def index
  
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

  def new
   
	@user = User.find(current_user.id) 
	@governments = Government.all 
	@routes = @user.routes.all
	@route = Route.new
	#@route.begin_text = "1305 Delbruck Ave, North Vancouver"
	#@route.end_text = "4330 Kingsway, Burnaby"
	#@route.name = "R"

	@LatLngBndsSWx = -125
	@LatLngBndsSWy = -25
	@LatLngBndsNEx = 100
	@LatLngBndsNEy = 50

	respond_to do |format|

	format.html # new.html.erb
	format.xml  { render :xml => @post }
	end
	
  end

  def create
	
	@user = User.find(current_user.id)	
	@route = @user.routes.new(params[:route])		
	
	respond_to do |format|
	if @route.save
	     format.html { redirect_to(user_route_path, :notice => 'Route was successfully created.') }
	     format.xml  { render :xml => @route, :status => :created, :location => @route }
	    else
	     format.html { render :action => "new" }
	     format.xml  { render :xml => @route.errors, :status => :unprocessable_entity }
	end
	end
  end

  def edit
  
	@user = User.find(current_user.id)
	@governments = Government.all 
	@routes = @user.routes.all
	@route = @user.routes.find(params[:id])
	@sections = Section.find_all_by_routes_id(@route.id)

	respond_to do |format|
	format.html # edit.html.erb
	format.xml  { render :xml => @route }
	end
	end

  def update
  end

  def destroy
  
	@route = Route.find(params[:id])
	@route.destroy

	respond_to do |format|
	format.html { redirect_to(routes_url) }
	format.xml  { head :ok }
	end
	
  end

  def show

	@user = User.find(current_user.id)
	@governments = Government.all 
	@routes = @user.routes.all
	@route = @user.routes.find(params[:id])

	#geom = @route.geom
	#bounding_box = geom.bounding_box()

	#@LatLngBndsSWx = bounding_box[0].x
	#@LatLngBndsSWy = bounding_box[0].y
	#@LatLngBndsNEx = bounding_box[1].x
	#@LatLngBndsNEy = bounding_box[1].y

	#@Route_YX = Array.new
	#geom.length.times do |i|
	#@Route_YX[i] = [ geom[i].y, geom[i].x ]
	#end
	
	#@sections = Section.find_all_by_routes_id(@route.id)

	respond_to do |format|
	format.html # show.html.erb
	format.xml  { render :xml => @route }
	format.js
	end
	end

end
