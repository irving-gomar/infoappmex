class SheltersController < ApplicationController
  before_action :set_ong, only: [:new, :create] #Para vistas (@ong, @shelter)

  def index
    @ong = Ong.find(params[:id])
    @shelters = @ong.shelters
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.ong = @ong
    @shelter.save!
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update(shelter_params)
    redirect_to shelter_path(@shelter)
  end

  def destroy
    @shelter = Shelter.find(params[:id])
    @shelter.destroy
    redirect_to shelters_path
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :address, :description, :max_capacity)
  end

  def set_ong
    @ong = Ong.find(params[:ong_id])
  end
end
