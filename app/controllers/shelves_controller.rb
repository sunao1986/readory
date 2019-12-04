class ShelvesController < ApplicationController

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf.save
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    @shelf.destroy
  end

  def update
    @shelf = Shelf.find(params[:id])
    @shelf.update(shelf_update_params)
  end

  private

  def shelf_params
    params.permit(:name).merge(user_id: current_user.id)
  end

  def shelf_update_params
    params.permit(:name).merge(user_id: current_user.id)
  end

end
