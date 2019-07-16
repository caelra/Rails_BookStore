class SearchController < ApplicationController
  def create
    search_word = "%#{params[:keyword]}%"
    @books = Book.where("title LIKE ? OR author LIKE ?", search_word, search_word)
    if search_word.is_a? Integer
      @books = Book.where("year = ?", search_word)
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @books }
      format.js
    end
  end
end
