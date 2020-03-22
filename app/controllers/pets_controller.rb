# app/controllers/pets_controller.rb

class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params["id"])
  end

  def new
  end

  def create
    Pet.create(pet_params)
    redirect_to '/pets'
  end

  def edit
    @pet = Pet.find(params["id"])
  end

  def update
    pet = Pet.find(params["id"])
    pet.update(pet_params)
    redirect_to "/pets/#{params[:id]}"
  end

  private
  def pet_params
    params.permit(:name, :sex, :age, :description, :image, :id)
  end

end
