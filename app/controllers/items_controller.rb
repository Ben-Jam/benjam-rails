class ItemsController < ApplicationController
  def index
    items = []
    Item.order(:position).find_all.each do | item|
      items << {name: item.name,position: item.position,id: item.id}
    end
    render json: items
  end
end
