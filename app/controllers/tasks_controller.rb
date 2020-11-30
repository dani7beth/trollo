class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.all_tasks(@list)
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end
  
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    @tasks = @list.tasks
    
    @tasks.each_with_index do |task, i|
      task[:position] = i + 1
    end
    if @task.save
      redirect_to board_path(@list[:board_id])
    else
      render :new
    end
  end

  def edit
    @list= List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @tasks = Task.all
  end

  

  def update
    @list= List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    # tmppositions = []
    current_task_pos = @task[:position]
    next_task_pos = @task.next[:position]
    current_task_pos = next_task_pos
    @task[:position] = current_task_pos
    next_task_pos = @task[:position]

    
  
    # @list.tasks.each_with_index do |task, i|
    #   # tmppositions << task.position
    #   # @positions << tmppositions
    #   @positions << task
    #   if task[:position] == @list.tasks.find(ActiveRecord::Base.connection.execute("select last_value from tasks_id_seq").first["last_value"])[:position]
    #     flash[:alert] = "SAME POSition"
    #     @positions.insert(i, task)
    #   end
    # end
    
    
    
   
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
    params.require(:task).permit(:task_name, :detail, :list_id, :position)
  end
end
