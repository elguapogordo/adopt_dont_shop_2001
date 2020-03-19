# app/controllers/shelters_controller.rb

class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

end
