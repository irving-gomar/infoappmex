class VolunteeringsController < ApplicationController
  # def index
  #   @volunteerings = Volunteering.all
  # end

  # def show
  #   @volunteering = Volunteering.find(params[:id])
  # end

  def create
    @volunteering = Volunteering.new
    @volunteering.user = current_user
    @service = Service.find(params[:service_id])
    @volunteering.service = @service
    @volunteering.save!

    redirect_to profile_path
  end

  # def edit
  #   @volunteering = Volunteering.find(params[:id])
  # end

  # def update
  #   @volunteering = Volunteering.find(params[:id])
  #   @volunteering.update(volunteer_params)
  #   redirect_to volunteer_path(@volunteer)
  # end

  # def destroy
  #   @volunteering = Volunteering.find(params[:id])
  #   @volunteering.destroy
  #   redirect_to volunteers_path
  # end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name,)
  end

  def set_ong
    @ong = Ong.find(params[:ong_id])
  end
end
