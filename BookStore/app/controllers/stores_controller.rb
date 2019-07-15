class StoresController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @store = current_user.stores.create if logged_in?
  end

  def show 
    @user = User.find(params[:id])
    @stores = @user.stores.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    @store = current_user.stores.new 
  end

  def create
    @store = current_user.stores.create(store_params)
    if @store.save
      flash[:success] = "Store created!"
      redirect_to root_url
    else
      flash[:error] = "Incorrect Input :("
      redirect_to root_url
    end
  end

  def destroy
    set_store.destroy
    flash[:success] = "Store deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      flash[:success] = "Store updated"
      redirect_to @store
    else
      render 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    def correct_user
      @store = current_user.stores.find_by(id: params[:id])
      redirect_to root_url if @store.nil?
    end

    def store_params
      params.require(:store).permit(:codename, :address, :phone)
    end
end
