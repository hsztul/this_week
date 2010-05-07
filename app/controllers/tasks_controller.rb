class TasksController < ApplicationController
  before_filter :authenticate_user!
  attr_accessor :completed
  respond_to :html, :xml

  def index
    @user = current_user
    @complete = current_user.tasks.incomplete
    @task = current_user.tasks.new
  end
  
  def showall
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      flash[:notice] = "Successfully created task."
      redirect_to tasks_url
    else
      render :action => 'new'
    end
  end
  
  def complete
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to tasks_url
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to @task
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to tasks_url
  end
end
