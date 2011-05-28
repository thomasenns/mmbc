class SectionsController < ApplicationController
  def index
  
	@governments = Government.all
	@user = User.find(current_user.id)
	@routes = @user.routes.all
	@route = @user.routes.find(params[:route_id])
	@sections = @route.sections.all
   
   	geom = @route.geom
   
   	@Route_YX = Array.new
   	geom.length.times do |i|
   	@Route_YX[i] = [ geom[i].y, geom[i].x ]
   	end 
   	
    	bounding_box = geom.bounding_box()
   	   
       	@LatLngBndsSWx = bounding_box[0].x
       	@LatLngBndsSWy = bounding_box[0].y
       	@LatLngBndsNEx = bounding_box[1].x
    	@LatLngBndsNEy = bounding_box[1].y
   
	respond_to do |format|
	format.html # index.html.erb
	format.xml  { render :xml => @routes }
	end  
  end

  def new
   @user = User.find(current_user.id)
   @route = @user.routes.find(params[:route_id])
   @section = Section.new
      
   respond_to do |format|
    format.html # new.html.erb
    format.xml  { render :xml => @section }
   end
  end

  def create
  
   @user = User.find(current_user.id)
   @route = @user.routes.find(params[:route_id])
     
   respond_to do |format|
    if @route.sections.create(params[:section])
     format.html { redirect_to(user_route_sections_path, :notice => 'Route was successfully created.') }
     format.xml  { render :xml => @section, :status => :created, :location => @section }
     else
      format.html { render :action => "new" }
      format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
     end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  
	@governments = Government.all
	@user = User.find(current_user.id)   
	@routes = @user.routes.all
	@route = @user.routes.find(params[:route_id])
	@sections = @route.sections.all
	@time_lines = @route.time_lines.all    
	@section = Section.find(params[:id])

	geom = @route.geom

	@Route_YX = Array.new
	geom.length.times do |i|
	@Route_YX[i] = [ geom[i].y, geom[i].x ]
	end 
	
	geom = @section.geom
	bounding_box = geom.bounding_box()
	
	@Step_YX = Array.new
	geom.length.times do |i|
	@Step_YX[i] = [ geom[i].y, geom[i].x ]
	end 
        
    	@LatLngBndsSWx = bounding_box[0].x
    	@LatLngBndsSWy = bounding_box[0].y
    	@LatLngBndsNEx = bounding_box[1].x
    	@LatLngBndsNEy = bounding_box[1].y
    
	respond_to do |format|
	format.html # show.html.erb
	format.xml  { render :xml => @section }
	end
  end

end
