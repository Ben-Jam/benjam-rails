class ItemsController < ApplicationController

respond_to :html, :json

  def index
    @items = Item.order(:position).where('parent_id IS NULL')
    respond_with @items
  end

  def show
    @item = Item.find(params[:id])
    @items = @item.children.order(:position)
    if(@items.empty?)
      render :show_choice
    else
      render :show
    end
  end  
  
  def new
    @item = Item.new new_item_params
    @item.parent_id = params[:item_id]
  end

  def create
    @item = Item.create item_params
    if params[:item][:parent_id]
      path = item_path(@item.parent)
    else
      path = items_path
    end
    redirect_to path, notice: 'Created'
  end

  private

  def new_item_params
    params.permit(:name)
  end

  def item_params
    params.require(:item).permit(:name, :parent_id)
  end
end
