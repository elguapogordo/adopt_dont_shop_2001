# app/controllers/pets_controller.rb

class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

end
