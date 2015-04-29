class ListController < ApplicationController
  def index
    @lists = List.all
    @list  = List.new
  end

  def create
    List.create(title: params[:list][:title])
    redirect_to root_path
  end
end
