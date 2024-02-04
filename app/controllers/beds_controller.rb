class BedsController < ApplicationController
  before_action :set_shelter, only: [:new, :create]

  def index
    @shelter = Shelter.find(params[:id])
    @beds = @shelter.beds
  end

  def show
    @bed = Bed.find(params[:id])
  end

  def new
    @bed = Bed.new
  end

  def create
    @bed = Bed.new(bed_params)
    @bed.shelter = @shelter
    @bed.save!
  end

  def edit
    @bed = Bed.find(params[:id])
  end

  def update
    @bed = Bed.find(params[:id])
    @bed.update(bed_params)
    redirect_to bed_path(@bed)
  end

  def destroy
    @bed = Bed.find(params[:id])
    @bed.destroy
    redirect_to beds_path
  end

  private

  def bed_params
    params.require(:bed).permit(:name, :address, :description, :max_capacity)
  end

  def set_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end
end
