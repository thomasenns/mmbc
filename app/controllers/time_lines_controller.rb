class TimeLinesController < ApplicationController
  def index
     @governments = Government.all
     @user = User.find(current_user.id)
     @routes = @user.routes.all
     @route = @user.routes.find(params[:route_id])
     @time_lines = @route.time_lines.all
     
     respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @routes }
    end 
  end

  def new
   @user = User.find(current_user.id)
   @route = @user.routes.find(params[:route_id])
   @time_line = TimeLine.new
        
   respond_to do |format|
    format.html # new.html.erb
    format.xml  { render :xml => @time_line }
   end
  end

  def create
   @user = User.find(current_user.id)
   @route = @user.routes.find(params[:route_id])

   respond_to do |format|
    if @route.time_lines.create(params[:time_line])
     format.html { redirect_to(user_route_time_lines_path, :notice => 'Route was successfully created.') }
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
     @time_line = TimeLine.find(params[:id])
      
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_line }
   end
  end

end
