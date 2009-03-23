class QualitiesController < ApplicationController
  # GET /qualities
  # GET /qualities.xml
  def index
    @qualities = Qualities.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qualities }
    end
  end

  # GET /qualities/1
  # GET /qualities/1.xml
  def show
    @qualities = Qualities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qualities }
    end
  end

  # GET /qualities/new
  # GET /qualities/new.xml
  def new
    @qualities = Qualities.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qualities }
    end
  end

  # GET /qualities/1/edit
  def edit
    @qualities = Qualities.find(params[:id])
  end

  # POST /qualities
  # POST /qualities.xml
  def create
    @qualities = Qualities.new(params[:qualities])

    respond_to do |format|
      if @qualities.save
        flash[:notice] = 'Qualities was successfully created.'
        format.html { redirect_to(@qualities) }
        format.xml  { render :xml => @qualities, :status => :created, :location => @qualities }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qualities.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qualities/1
  # PUT /qualities/1.xml
  def update
    @qualities = Qualities.find(params[:id])

    respond_to do |format|
      if @qualities.update_attributes(params[:qualities])
        flash[:notice] = 'Qualities was successfully updated.'
        format.html { redirect_to(@qualities) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qualities.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qualities/1
  # DELETE /qualities/1.xml
  def destroy
    @qualities = Qualities.find(params[:id])
    @qualities.destroy

    respond_to do |format|
      format.html { redirect_to(qualities_url) }
      format.xml  { head :ok }
    end
  end
end
