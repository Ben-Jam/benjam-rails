class ClientsController < ApplicationController

 def show 
    @mode = params[:mode] || cookies[:mode] || 'default'
     
    @client = Client.where('name = ?', params[:id]).first
    @items = Item.order(:position).where('client_id = ? and parent_id IS NULL',@client.id)
    respond_to do |format|
        format.html {
             @item = Item.new
             @item.name = "#{@client.name} homepage"
             @item.client = @client
             render :template => "items/index" 
        }
        format.json {
            extract = []
            @items.each do |i|
                extract << item_extract(i)
            end
            render :json => extract
            
        }
    end
  end  

    def item_extract(item)
     return { :id => item.id, :name => item.name, :position => item.position, :parent_id => item.parent_id,
         :image => item_path(item.id) + "/image.jpg", :audio => item_path(item.id) + "/audio.mpeg" }
      end

end
