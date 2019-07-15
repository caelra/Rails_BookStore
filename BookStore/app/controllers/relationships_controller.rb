class RelationshipsController < ApplicationController

    def index
        @store = Store.find(params[:id])
        @relationship = @store.relationships.create
    end

    def show
        @store = Store.param([:id])
        @book = @store.book.paginate(page: params[:page])
        redirect_to @book
    end

    def new
        @book = Book.all 
        @store = Store.find(params[:id])
        @relationship = @store.relationships.new
    end

    def create
        @store = Store.find(params[:id])
        @relationship = @store.relationships.create(relationship_params)
        if @relationship.save
            flash[:success] = 'Book added to Store Successfully!!!'
            redirect_to current_user
        else
            flash[:error] = 'Error :('
            redirect_to current_user
        end
    end

    private
      def relationship_params
          params.require(:relationship).permit(:book_id, :quantity)
      end

      def correct_user
        @relationship = current_user.relationships.find_by(id: params[:id])
        redirect_to root_url if @relationship.nil?
      end
end
