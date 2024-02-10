class VolunteersController < ApplicationController
  def index
    @volunteers = volunteer.all
  end

  def show
    @volunteer = volunteer.find(params[:id])
  end

  def new
    @volunteer = volunteer.new
  end

  def create
    @volunteer = volunteer.new(volunteer_params)
    @volunteer.service = @service
    @volunteer.save!
  end

  def edit
    @volunteer = volunteer.find(params[:id])
  end

  def update
    @volunteer = volunteer.find(params[:id])
    @volunteer.update(volunteer_params)
    redirect_to volunteer_path(@volunteer)
  end

  def destroy
    @volunteer = volunteer.find(params[:id])
    @volunteer.destroy
    redirect_to volunteers_path
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name,)
  end

  def set_ong
    @ong = Ong.find(params[:ong_id])
  end
end
