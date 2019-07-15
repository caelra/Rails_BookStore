class SearchesController < ApplicationController
  def new
    @query = Search.new
    #@titles = Book.all.uniq.pluck(:title)
  end

  def create
    @query = Search.create(search_params)
    redirect_to @query
  end

  def show
    @query = Search.find(params[:id])
  end

  private

    def search_params
      params.require(:search).permit(:title, :author, :year)
    end
end
