class BiznamesController < ApplicationController
  # GET /biznames
  # GET /biznames.xml

  layout "suggestions"
  
  def index
    @biznames = Bizname.all
    @bizname = Bizname.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @biznames }
    end
  end

  # GET /biznames/1
  # GET /biznames/1.xml
  def show
    @biznames = Bizname.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @biznames }
    end
  end

  # GET /biznames/new
  # GET /biznames/new.xml
  def new
    @biznames = Bizname.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @biznames }
    end
  end

  # GET /biznames/1/edit
  def edit
    @biznames = Bizname.find(params[:id])
  end

  # POST /biznames
  # POST /biznames.xml
  def create
    @bizname = Bizname.new(params[:bizname])

    respond_to do |wants|
      if @bizname.save
        
        Administrator.each do |admin|
          UserMailer.deliver_author_signup_notification(admin, params[:bizname][:friend])
        end
        
        wants.js do
          render :partial => "bizname_created"
        end
          wants.html { redirect_to :controller => "account/distributor_payments"}
      else
      end
    end
  end

  # PUT /biznames/1
  # PUT /biznames/1.xml
  def update
    @biznames = Bizname.find(params[:id])

    respond_to do |format|
      if @biznames.update_attributes(params[:biznames])
        flash[:notice] = 'Bizname was successfully updated.'
        format.html { redirect_to(@biznames) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @biznames.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /biznames/1
  # DELETE /biznames/1.xml
  def destroy
    @biznames = Bizname.find(params[:id])
    @biznames.destroy

    respond_to do |format|
      format.html { redirect_to(biznames_url) }
      format.xml  { head :ok }
    end
  end
end
