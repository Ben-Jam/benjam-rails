class ChooserController < ApplicationController
  def index
    @client = Client.where('name = ?', params[:client_id]).first
  	
  end
end
