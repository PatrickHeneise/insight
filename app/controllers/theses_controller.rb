class ThesesController < ApplicationController
  # GET /theses
  # GET /theses.xml
  def index
    @theses = Thesis.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @theses }
    end
  end
	
	# GET /theses
  # GET /theses.xml
  def own
    @theses = current_user.theses

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @theses }
    end
  end
	
	# GET /theses
  # GET /theses.xml
  def processing
    @theses = Thesis.processing

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @theses }
    end
  end
	
	# GET /theses
  # GET /theses.xml
  def applied
    @theses = Thesis.applied

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @theses }
    end
  end
	

  # GET /theses/1
  # GET /theses/1.xml
  def show
    @thesis = Thesis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thesis }
    end
  end

  # GET /theses/new
  # GET /theses/new.xml
  def new
    @thesis = Thesis.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thesis }
    end
  end

  # GET /theses/1/edit
  def edit
    @thesis = Thesis.find(params[:id])
  end

  # POST /theses
  # POST /theses.xml
  def create
    @thesis = Thesis.new(params[:thesis])
		@thesis.editor = current_user
		if(params[:thesis][:delivery] == 'ss_ss')
			@thesis.delivery = Date.new(Date.today.year, 6, 30)
		elsif(params[:thesis][:delivery] == 'ss_ws')
			@thesis.delivery = Date.new(Date.today.year, 12, 31)
		elsif(params[:thesis][:delivery] == 'ws_nss')
			@thesis.delivery = Date.new(Date.today.year, 6, 30)
		elsif(params[:thesis][:delivery] == 'ws_nws')
			@thesis.delivery = Date.new(Date.today.year-1, 12, 31)
		elsif(params[:thesis][:delivery] == 'ws_ws')
			@thesis.delivery = Date.new(Date.today.year, 12, 31)
		elsif(params[:thesis][:delivery] == 'ws_ss')
			@thesis.delivery = Date.new(Date.today.year+1, 6, 30)
		end

    respond_to do |format|
      if @thesis.save
        flash[:notice] = 'Thesis was successfully created.'
        format.html { redirect_to(@thesis) }
        format.xml  { render :xml => @thesis, :status => :created, :location => @thesis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thesis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /theses/1
  # PUT /theses/1.xml
  def update
    @thesis = Thesis.find(params[:id])

    respond_to do |format|
      if @thesis.update_attributes(params[:thesis])
        flash[:notice] = 'Thesis was successfully updated.'
        format.html { redirect_to(@thesis) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thesis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /theses/1
  # DELETE /theses/1.xml
  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy

    respond_to do |format|
      format.html { redirect_to(theses_url) }
      format.xml  { head :ok }
    end
  end
end
