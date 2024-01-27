class OngsController < ApplicationController
  def index
    @ongs = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
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

  private 

  def ong_params
    params.require(:ong).permit(:name, :description, :address, :longitude, :latitude, :website, :photo)
  end
end
