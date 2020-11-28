class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end
  
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_path(@list[:board_id])
    else
      render :new
    end
  end

  def edit
    @list= List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end

  def update
    @list= List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_path(@list[:board_id])
    else
      render :edit
    end
  end 

  def destroy
    @list= List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to board_path(@list[:board_id])
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :detail, :list_id)
  end
end
