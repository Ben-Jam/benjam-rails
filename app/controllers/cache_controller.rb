class CacheController < ApplicationController
  def index
  	@items = Item.all

  	render layout: false
  	response.headers['Content-Type'] = 'text/cache-manifest'
  end
end
