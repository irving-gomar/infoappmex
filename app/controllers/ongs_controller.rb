class OngsController < ApplicationController
  def index
    @ongs = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])

    @shelter_markers = @ong.shelters.geocoded.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude
      }
    end
  end

  def new
    @ong = Ong.new
  end

  def create
    @ong = Ong.new(ong_params)
    @ong.user = current_user
    @ong.save!
    redirect_to ongs_path
  end

  def destroy
    @ong = Ong.find(params[:id])
    @ong.destroy!
    redirect_to ongs_path
  end

  def edit
    @ong = Ong.find(params[:id])
  end

  def update
    @ong = Ong.find(params[:id])
    if @ong.update(ong_params)
      redirect_to @ong
    else
      render :edit
    end
  end

  def my_ongs 
    @ongs = current_user.ongs
  end

  private 

  def ong_params
    params.require(:ong).permit(:name, :description, :address, :longitude, :latitude, :website, :photo)
  end
end
