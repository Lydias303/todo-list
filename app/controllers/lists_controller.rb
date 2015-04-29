class ListsController < ApplicationController
  def index
    @lists = List.all
    @list  = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    List.create(title: params[:list][:title])
    redirect_to root_path
  end
end
