class GroupsController < ApplicationController
  def show
    render json: [:apple, :banana, :pool, :water, :computer, :toast, :tv, :hi5, :marshmallow]
  end
end
