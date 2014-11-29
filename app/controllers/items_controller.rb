class ItemsController < ApplicationController

respond_to :html, :json

  def index
    @items = Item.order(:position).where('parent_id IS NULL')
    respond_with @items
  end

  def show
    @items = Item.order(:position).where('parent_id = ?',params[:id])
    if(@items.empty?)
      @item = Item.find(params[:id])
      render :show_choice
    else
      render :show
    end
  end  
  
  def new
    @item = Item.new item_params
  end

  def create
    @item = Item.create item_params
    redirect_to blahs_path, notice: 'Created'
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
