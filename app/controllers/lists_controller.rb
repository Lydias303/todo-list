class ListsController < ApplicationController
  respond_to :html, :json

  def index
    @lists = List.order(created_at: :desc)
    respond_with @list = List.new
  end

  def show
    respond_with @list = List.find(params[:id]).as_json(:include => [:todos])
  end

  def create
    List.create(title: params[:list][:title])
    redirect_to root_path
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to root_url
  end
end
