class ItemsController < ApplicationController
  def index
    render json: [:apple, :banana, :pool, :water, :computer, :toast, :tv, :hi5, :marshmallow]
  end
end
