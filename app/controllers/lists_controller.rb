class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    # @movies = Movie.find
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
