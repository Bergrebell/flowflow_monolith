class StationsController < ApplicationController
  def index
    sleep(2)
    @stations = Station.all
  end
end
