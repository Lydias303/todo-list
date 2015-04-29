class ListsController < ApplicationController
  respond_to :html, :json

  def index
    @lists = List.order(created_at: :desc)
    respond_with @list = List.new
  end

  def show
    respond_with @list = List.find(params[:id])
  end

  def create
    List.create(title: params[:list][:title])
    redirect_to root_path
  end
end
