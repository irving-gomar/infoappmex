class SheltersController < ApplicationController
  before_action :set_ong, only: [:new, :create] #Para vistas (@ong, @shelter)

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])

    @shelter_marker = [
      {
        lat: @shelter.latitude,
        lng: @shelter.longitude
      }]
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.ong = @ong
    if @shelter.save
      @shelter.max_capacity.times do
        Bed.create(shelter: @shelter)
      end
      redirect_to ong_path(@ong)
    else
      render :new, status: :unprocessable_entity
    end
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
