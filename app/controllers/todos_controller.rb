class TodosController < ApplicationController
  respond_to :html, :json

  def create
    todo = List.find(params[:todo][:list]).todos.create(todo_item: params[:todo][:text])
    respond_with({ todo: todo }, :status => 201, :location => root_path)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end
end
