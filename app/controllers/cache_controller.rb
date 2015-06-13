class CacheController < ApplicationController
  def index
  	@items = Item.all
    @environment = Rails.application.assets
    @asset_list = @environment.each_logical_path(*Rails.application.config.assets).to_a

  	render layout: false
  	response.headers['Content-Type'] = 'text/cache-manifest'
  end
end
