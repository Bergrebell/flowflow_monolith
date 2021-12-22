class SearchesController < ApplicationController
  def index
    @stations = Station.containing(params[:query])
  end
end