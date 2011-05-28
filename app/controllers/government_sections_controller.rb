class GovernmentSectionsController < ApplicationController
  def index
  
   @governments = Government.all
   @government = Government.find(params[:government_id])
   @sections = @government.sections.all
   
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
   @government = Government.find(params[:government_id])
   @sections = @government.sections.all
   @section = Section.find(params[:id])
    
   respond_to do |format|
    format.html # show.html.erb
    format.xml  { render :xml => @section }
   end
  end

end
