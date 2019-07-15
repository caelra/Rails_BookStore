class BooksController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
  
    def index
      @book = current_user.books.create if logged_in?
    end
  
    def show 
      @user = current_user
      @book = current_user.books.new 
      @books = @user.books.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    end
  
    def create
      @book = current_user.books.create(book_params)
      if @book.save
        flash[:success] = "Book created!"
        redirect_to root_url
      else
        flash[:error] = "Incorrect Input :("
        redirect_to root_url
      end
    end
  
    def destroy
      set_book.destroy
      flash[:success] = "Book deleted"
      redirect_to request.referrer || root_url
    end

    def edit
      @book = Book.find(params[:id])
    end
  
    def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
        flash[:success] = "Book updated"
        redirect_to @book
      else
        render 'edit'
      end
    end
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title, :author, :year)
      end
end
