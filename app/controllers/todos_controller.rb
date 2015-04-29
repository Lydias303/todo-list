class TodosController < ApplicationController

  def create
    @list = List.find(params[:todo][:list_id]).todos.create(todo_params)
    redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:todo_item, :completed, :priority)
  end
end
