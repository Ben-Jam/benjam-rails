class EventsController < ApplicationController


before_filter :set_client

  # GET /events
  # GET /events.json
  def index
    @events = Event.where("client_id = ?",@client.id)
  end

  def create
    eventToCreate = Event.new()
    eventToCreate.event_type = params[:name]
    eventToCreate.description = params[:description]
    eventToCreate.client = @client
    eventToCreate.save

    respond_to do |format|
      format.html { redirect_to client_events_path(@client), notice: 'Created'}
      format.json { render json:  eventToCreate}
    end

  end

  def set_client
    @client = Client.where('name = ?', params[:client_id]).first if params[:client_id]
  end

end
