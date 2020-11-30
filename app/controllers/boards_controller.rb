class BoardsController < ApplicationController
  before_action :set_board, only: [:show,:edit,:update,:destroy, :move_up]
  def index
    @boards = Board.all_boards(current_user.id)
  end

  def show
    @lists = @board.lists
   
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      flash[:success] = "Board Created"
      redirect_to boards_path
    else
      flash[:error] = "Error #{@board.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  # def move_up
  #   # @tmp = ActiveRecord::Base.connection.execute("select last_value from tasks_id_seq").first["last_value"]
  #   # @item = Task.find(@tmp)
  #   # @tasks = Task.all
  #   # task_ids = Task.pluck(:id)
  #   # # task_ids.delete()
  #   # # new_task_ids = 
  #   # task_ids.each do |id|
  #   #   new_task_ids << id
  #   # end
  #   # @tasks.sort_by {|task| new_task_ids.index(task.id)}
    
  #   @tasks = Task.all
  #   @tasks = @tasks.sort_by{|t| -t[:id]}
  #   @tasks
  # end

  private
  def set_board
    @board = current_user.boards.find(params[:id])
  end
  def board_params
    params.require(:board).permit(:name)
  end
end
