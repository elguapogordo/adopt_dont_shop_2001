# app/controllers/shelter_pets_controller.rb

class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params["id"])
    @pets = @shelter.pets
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create(pet_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  private
  def pet_params
    params.permit(:name, :sex, :age, :description, :image, :adoptable, :id)
  end

end
