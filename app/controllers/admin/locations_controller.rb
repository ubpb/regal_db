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

private

  def location_params
    params.require(:location).permit(:identifier)
  end

end
