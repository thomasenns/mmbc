class MapsController < ApplicationController
  def new
  logger.debug "--0--";
  logger.debug params[:begin_text];
  logger.debug "--22--";
  
  @addressA = params[:begin_text];
    
  respond_to do |format|
  format.html # new.html.erb
  format.js
  end
  end
  
  def show
	respond_to do |format|
	format.html # show.html.erb
	format.js
	end
  end
end
