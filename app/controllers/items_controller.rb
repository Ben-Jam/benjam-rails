class ItemsController < ApplicationController

respond_to :html, :json

  def index
    @item = Item.root
    @items = Item.order(:position).where('parent_id = ?',@item.id)
    respond_with @items
  end


 def image
     @item = Item.find(params[:id])
     respond_to do |format|
         format.jpg do
             send_data @item.image, :type => 'image/jpg', :disposition => 'inline'
             end
     end
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
    if params[:item_id]
      @item.parent_id = params[:item_id]
      @item.position = Item.where(parent_id: params[:item_id]).count + 1
    end
  end

  def create
    @item = Item.new item_params
    @item.image = params[:item][:image].read if params[:item][:image]
    puts @item.inspect
    @item.save
    if params[:item][:parent_id].present?
      path = item_path(@item.parent)
    else
      path = items_path
    end
    redirect_to path, notice: 'Created'
  end

  private

  def new_item_params
    params.permit(:name, :parent_id, :position, :image)
  end

  def item_params
    params.require(:item).permit(:name, :parent_id, :position)
  end
end
