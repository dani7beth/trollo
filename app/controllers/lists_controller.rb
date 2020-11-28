class ListsController < ApplicationController
  
  def index
    @lists = List.all
    @tasks = @lists.tasks
  end

  def new
    @board = Board.find(params[:board_id])
    @list = List.new
  end
  
  def create
  @board = Board.find(params[:board_id])
  @list = @board.lists.new(list_params)
  if @list.save
    redirect_to @board
  else
    render :new
  end
  end

  def edit
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])
  end

  def update
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to @board
    else
      render :edit
    end
  end 

  def destroy
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])
    @list.destroy
    redirect_to @board
  end

private

  def list_params
    params.require(:list).permit(:name, :board_id)
  end
end
