class Admin::LocationsController < Admin::ApplicationController

  def index
    @locations = Location.order(:identifier)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Standort erfolgreich angelegt"
      redirect_to(admin_locations_path)
    else
      render(:new)
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Standort erfolgreich aktualisiert"
      redirect_to(admin_locations_path)
    else
      render(:edit)
    end
  end

private

  def location_params
    params.require(:location).permit(:identifier)
  end

end
