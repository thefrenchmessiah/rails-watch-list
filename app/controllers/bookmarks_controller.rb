class BookmarksController < ApplicationController
  before_action :set_list, only: %i[index new]
  before_action :set_bookmark, only: %i[destroy]

  def index
    @bookmarks = Bookmark.where(list_id: params[:list_id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to lists_path
  end

  def destroy
    @bookmark.destroy
    redirect_to list_bookmarks_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
