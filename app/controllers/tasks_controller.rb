class TasksController < ApplicationController
  before_filter :authenticate_user!
  attr_accessor :completed
  respond_to :html, :xml

  def index
    @user = current_user
    @incomplete = current_user.tasks.incomplete
    @task = current_user.tasks.new
    respond_with(@incomplete)
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
    if params[:task][:parent_id]==nil
      @task = current_user.tasks.new(params[:task])
      if @task.save
        flash[:notice] = "Task Created.  Time to get to work..."
        redirect_to tasks_url
      else
        render :action => 'new'
      end
    else
      @task = Task.find(params[:task][:parent_id])
      @subtask = @task.children.create(params[:task])
      if @subtask.save
        flash[:notice] = "Task Created.  Time to get to work..."
        redirect_to tasks_url
      else
        render :action => 'new'
      end
    end

  end
  
  def subtask
    @task = Task.find(params[:id])
    @subtask = @task.children.new
  end
  
  def complete
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    flash[:notice] = "Hoorray! Task Completed!"
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
    flash[:notice] = "Task terminated."
    redirect_to '/showall'
  end
end
