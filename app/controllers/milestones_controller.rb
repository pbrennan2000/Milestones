class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.xml
  def index
    @milestones = Milestone.all

    respond_to do |format|
      format.html # index.html.erb
      format.mobile {render :layout => false}
      format.xml  { render :xml => @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.xml
  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone }
      format.mobile {render :layout => false}
    end
  end

  # GET /milestones/new
  # GET /milestones/new.xml
  def new
    @milestone = Milestone.new
    @options_for_select = get_milestone_options

    respond_to do |format|
      format.html # new.html.erb 
      format.xml  { render :xml => @milestone }
      format.mobile {render :layout => false}
    end
    
   
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
    @options_for_select = get_milestone_options
    
    respond_to do |format|
      format.html
      format.mobile {render :layout => false}
    end
  end

  # POST /milestones
  # POST /milestones.xml
  def create
    @milestone = Milestone.new(params[:milestone])

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to(@milestone, :notice => 'Milestone was successfully created.') }
        format.mobile { redirect_to(@milestone, :notice => 'Milestone was successfully created.') }
        format.xml  { render :xml => @milestone, :status => :created, :location => @milestone }
      else
        format.html { render :action => "new" }
        format.mobile { render :action => "new", :layout => false }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.xml
  def update
    @milestone = Milestone.find(params[:id])
    logger.debug(params[:name])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to(@milestone, :notice => 'Milestone was successfully updated.') }
        format.mobile { redirect_to(@milestone, :notice => 'Milestone was successfully updated.') }  
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.mobile { render :action => "edit", :layout => false, :notice => 'Errors encountered, please correct them' }  
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.xml
  def destroy
    @milestone = Milestone.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.mobile { 
        # TODO:  Find a better way to do this, are only recalling it here, rather than
        # a redirect because we need to override and render the actual layout again
        @milestones = Milestone.all
        render :action => :index, :layout => true 
      }
      format.xml  { head :ok }
    end
  end
  
  private
  
  # Returns a hash of options based on milestone names for the select tag
  def get_milestone_options
    option_hash = {}
    
    # first get all the distinct ones that this user has added
    milestone_names = Milestone.find_distinct_milestones
    
    if milestone_names
      option_hash["Add New"] = "Add New"
    end
    
    # now convnert this into a name/value hash. Doing it this way rather than options_for_colleciton so that
    # the automatic matching for selected still happens and that we can have the Add New Option
    
    milestone_names.each do |item|
      option_hash[item.name] = item.name
    end
    
    option_hash
    
  end
end