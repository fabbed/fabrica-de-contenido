class Admin::ProjectJobsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @jobs = @project.jobs
  end


  def new
    @job = Job.new
    @project = Project.find(params[:project_id])
  end
  
  def create
    @job = Job.new(params[:job])
    @project = Project.find(params[:project_id])
        
    @job.project = @project
    
    respond_to do |wants|
      if @job.save
        flash[:notice] = 'Jobs was successfully created.'
        wants.html { redirect_to(admin_project_jobs_path(@project)) }
        wants.xml { render :xml => @job, :status => :created, :location => @job }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end



end
