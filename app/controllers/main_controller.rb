class MainController < ApplicationController
  def index
    @performances = Performance.all
  end
end
