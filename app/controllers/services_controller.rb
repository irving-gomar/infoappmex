class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @ong = Ong.find(params[:ong_id])
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.ong_id = params[:ong_id]
    if @service.save
      redirect_to ong_path(@service.ong_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :date_from, :date_to)
  end

  def set_ong
    @ong = Ong.find(params[:ong_id])
  end
end
