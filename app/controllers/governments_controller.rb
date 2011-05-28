class GovernmentsController < ApplicationController
  def index
    @governments = Government.all
    
    @LatLngBndsSWx = -125
    @LatLngBndsSWy = -25
    @LatLngBndsNEx = 100
    @LatLngBndsNEy = 50
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @government }
    end   
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @governments = Government.all
    @government = Government.find(params[:id])
    @sections = Section.find_all_by_governments_id(@government.id)
 
    bounding_box = @government.geom.bounding_box()

    @LatLngBndsSWx = bounding_box[0].x
    @LatLngBndsSWy = bounding_box[0].y
    @LatLngBndsNEx = bounding_box[1].x
    @LatLngBndsNEy = bounding_box[1].y
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @government }
    end
  end

end
